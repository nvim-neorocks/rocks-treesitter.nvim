---@mod rocks_treesitter.config

---@package
---@class RocksTreesitterConfig
local config = {
    ---@type boolean | "prompt"
    auto_install = "prompt",
    ---@type "all" | { [string]: boolean? }
    auto_highlight = {},
}

local uv = vim.uv
local api = require("rocks.api")

---@class RocksTreesitterOpts
---@field auto_highlight? string[] | "all" Parsers to automatically enable syntax highlighting for. Note that these are parser languages, not file types. Defaults to an empty list.
---@field auto_install? boolean | "prompt" Auto-install parsers in `auto_highlight` as needed? Default: 'prompt'

local toml_config = api.get_rocks_toml()["tree-sitter"]
---@type RocksTreesitterOpts
local lua_config = vim.g.rocks_nvim and vim.g.rocks_nvim.treesitter

local opts = {}

if type(toml_config) == "table" then
    opts = vim.tbl_deep_extend("force", opts, toml_config)
end

opts = vim.tbl_deep_extend("force", config or opts, lua_config or {})

--- Map opts to configs, preserving defaults if not set
config.auto_highlight = opts.auto_highlight == "all" and "all"
    or vim.iter(opts.auto_highlight or {}):fold({}, function(acc, lang)
        ---@cast lang string
        acc[lang] = true
        return acc
    end)
config.auto_install = opts.auto_install == nil and config.auto_install or opts.auto_install

if not toml_config and not lua_config then
    local default_toml = [==[
# This will install parsers as needed
[[tree-sitter.auto_highlight]]
# "all"
# "<lang>" (e.g. "python")

[tree-sitter]
auto_install = false
]==]
    local rocks_toml_path = api.get_rocks_toml_path()
    uv.fs_open(rocks_toml_path, "r", tonumber("644", 8), function(err, file)
        if err or not file then
            return
        end
        local stat = uv.fs_fstat(file)
        if not stat then
            return
        end
        local content = uv.fs_read(file, stat.size, 0) .. "\n\n" .. default_toml
        uv.fs_close(file)
        uv.fs_open(rocks_toml_path, "w+", tonumber("644", 8), function(err_write, file_write)
            if err_write or not file_write then
                return
            end
            local file_pipe = uv.new_pipe(false)
            uv.write(file_pipe, content)
            uv.fs_close(file)
        end)
    end)
end

return config
