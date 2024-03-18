---@mod rocks_treesitter.config

local config

local uv = vim.uv
local api = require("rocks.api")

---@class RocksTreesitterOpts
---@field auto_install? boolean Auto-install parsers when needed?
---@field auto_highlight? string[] Languages to automatically enable syntax highlighting for.

---@class RocksTreesitterConfig
---@package
local default_config = {
    ---@type boolean | string[]
    auto_install = false,
    ---@type string[]
    auto_highlight = {},
}

local toml_config = api.get_rocks_toml()["tree-sitter"]
---@type RocksTreesitterOpts
local lua_config = vim.g.rocks_nvim and vim.g.rocks_nvim.treesitter or {}

if type(toml_config) == "table" then
    config = vim.tbl_deep_extend("force", default_config, toml_config)
end

---@type RocksTreesitterConfig
config = vim.tbl_deep_extend("force", config or default_config, lua_config)

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
    uv.fs_open(rocks_toml_path, "w+", tonumber("644", 8), function(err, file)
        if err or not file then
            return
        end
        local stat = uv.fs_fstat(file)
        if not stat then
            return
        end
        local content = uv.fs_read(file, stat.size, 0)
        content = content .. "\n\n" .. default_toml
        local file_pipe = uv.new_pipe(false)
        uv.write(file_pipe, content)
        uv.fs_close(file)
    end)
end

return config
