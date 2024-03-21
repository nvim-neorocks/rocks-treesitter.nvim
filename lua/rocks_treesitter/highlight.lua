---@mod rocks_treesitter.highlight

local highlight = {}

local api = require("rocks.api")

local sysname = vim.uv.os_uname().sysname:lower()
local parser_extension = (sysname:find("windows") and "dll") or (sysname:find("darwin") and "dylib") or "so"

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
    local parser_file = ("parser/{}.{}"):format(lang, parser_extension)
    return not vim.tbl_isempty(vim.api.nvim_get_runtime_file(parser_file, true))
end

---@param lang string
---@return Rock[]
local function find_parser_rock(lang)
    local rock_name = "tree-sitter-" .. lang
    local rocks = api.try_get_cached_rocks()
    return rocks[rock_name]
end

---@param rock Rock
local function try_start_highlight(rock)
    local success = pcall(vim.cmd.Rocks, "packadd", rock.name)
    if not success then
        return
    end
    vim.treesitter.start()
end

---@param rocks Rock[]
local function prompt_auto_install(rocks)
    ---@param version string?
    local function install_rock_if_version_set(version)
        if version then
            api.install(rocks[1].name, version, function(installed_rock)
                ---@cast installed_rock Rock
                try_start_highlight(installed_rock)
            end)
        end
    end
    if #rocks == 1 then
        local rock = rocks[1]
        local yesno = vim.fn.input("Install " .. rock.name .. "? y/n: ")
        print("\n ")
        if string.match(yesno, "^y.*") then
            install_rock_if_version_set(rock.version)
        end
    end
    local choices = #rocks == 1 and { "yes", "no" }
        or vim.iter(rocks)
            :map(function(rock)
                ---@cast rock Rock
                return rock.version
            end)
            :totable()
    vim.ui.select(choices, {
        prompt = "Install " .. rocks[1].name .. "? Select a version or <C-c> to cancel",
    }, install_rock_if_version_set)
end

---@param config RocksTreesitterConfig
---@param lang string
local function do_highlight(config, lang)
    if is_installed(lang) then
        vim.treesitter.start()
        return
    end
    local rocks = find_parser_rock(lang)
    if vim.tbl_isempty(rocks) then
        return
    end
    if config.auto_install == "prompt" then
        prompt_auto_install(rocks)
    elseif config.auto_install then
        api.install(rocks[1].name, nil, try_start_highlight)
    end
end

---@param config RocksTreesitterConfig
function highlight.create_autocmd(config)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*" },
        group = vim.api.nvim_create_augroup("rocks_treesitter_higlight", { clear = true }),
        callback = function(ctx)
            ---@cast ctx AutoCmdContext
            local bufnr = ctx.buf
            local filetype = vim.bo[bufnr].filetype
            local lang = get_lang(filetype)
            if config.auto_highlight[lang] then
                do_highlight(config, lang)
            end
        end,
    })
end

return highlight
