---@mod rocks_treesitter.highlight

local highlight = {}

local api = require("rocks.api")
local config = require("rocks_treesitter.config")

for filetype, lang in pairs(config.parser_map) do
    vim.treesitter.language.register(lang, filetype)
end

local sysname = vim.uv.os_uname().sysname:lower()
local parser_extension = (sysname:find("windows") and "dll") or "so"

---@class AutoCmdContext
---@field id integer autocommand id
---@field event string name of the triggered event |autocmd-events|
---@field group? integer autocommand group id, if any
---@field match string expanded value of |<amatch>|
---@field buf integer expanded value of |<abuf>|
---@field file string expanded value of |<afile>|
---@field data unknown arbitrary data passed from |nvim_exec_autocmds()|

---@param filetype string
---@return string parser
local function get_lang(filetype)
    ---TODO use GitHub action to get parser filetypes from nvim-treesitter?
    return vim.treesitter.language.get_lang(filetype) or filetype
end

---@param lang string
---@return boolean
local function is_installed(lang)
    local parser_file = vim.fs.joinpath("parser", "%s.%s"):format(lang, parser_extension)
    return not vim.tbl_isempty(vim.api.nvim_get_runtime_file(parser_file, true))
end

---@param lang string
---@param callback fun(rock: Rock[])
local function find_parser_rock(lang, callback)
    local rock_name = "tree-sitter-" .. lang
    local rocks = api.try_get_cached_rocks()
    if rocks and rocks[rock_name] then
        return callback(rocks[rock_name])
    end
    -- Cache may not have been populated. Query luarocks.
    api.query_luarocks_rocks(function(luarocks_rocks)
        callback(luarocks_rocks[rock_name] or {})
    end)
end

---@param rock Rock
local function try_start_highlight(rock)
    local success = pcall(vim.cmd.packadd, { rock.name, bang = true })
    if not success then
        return
    end
    vim.treesitter.start()
end

---@type { [string]: boolean? }
local _declined_installs = {}

---@param rocks Rock[]
local function install_latest_version(rocks)
    local latest_version = rocks[1].version
    if #rocks > 1 then
        latest_version = vim.iter(rocks):fold(
            nil,
            ---@param latest_version_ vim.Version | nil
            ---@param rock Rock
            function(latest_version_, rock)
                ---@type boolean, vim.Version?
                local ok, version = pcall(vim.version.parse, rock.version)
                if latest_version_ then
                    return (ok and version and version > latest_version_ and version) or latest_version_
                else
                    return ok and version
                end
            end
        )
    end
    api.install(rocks[1].name, tostring(latest_version or "dev"), {
        callback = try_start_highlight,
        config_path = config.config_path,
    })
end

---@param rocks Rock[]
local function prompt_auto_install(rocks)
    local rock_name = rocks[1].name
    if _declined_installs[rock_name] then
        return
    end
    if vim.tbl_isempty(rocks) then
        return
    end
    local choice = vim.fn.confirm("Install " .. rocks[1].name .. "?", "&Yes\n&No", 2, "Question")
    if choice == 1 then
        install_latest_version(rocks)
    else
        _declined_installs[rock_name] = true
    end
end

---@param lang string
local function do_highlight(lang)
    if is_installed(lang) then
        vim.treesitter.start()
        return
    end
    find_parser_rock(lang, function(rocks)
        if vim.tbl_isempty(rocks) then
            return
        end
        if config.auto_install == "prompt" then
            vim.schedule(function()
                prompt_auto_install(rocks)
            end)
        elseif config.auto_install then
            install_latest_version(rocks)
        end
    end)
end

function highlight.create_autocmd()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*" },
        group = vim.api.nvim_create_augroup("rocks_treesitter_higlight", { clear = true }),
        callback = function(ctx)
            ---@cast ctx AutoCmdContext
            local bufnr = ctx.buf
            local filetype = vim.bo[bufnr].filetype
            local lang = get_lang(filetype)
            ---@type boolean | nil
            local disable
            if type(config.disable) == "function" then
                disable = config.disable(lang, bufnr)
            else
                disable = config.disable[filetype]
            end
            if not disable and config.auto_highlight == "all" or config.auto_highlight[lang] then
                do_highlight(lang)
            end
        end,
    })
end

return highlight
