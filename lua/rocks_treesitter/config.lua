---@mod rocks_treesitter.config

---@package
---@class RocksTreesitterConfig
local config = {
    ---@type boolean | "prompt"
    auto_install = "prompt",
    ---@type "all" | table<string, boolean>
    auto_highlight = {},
    ---@type table<string, string>
    parser_map = require("rocks_treesitter.ft_parser_map"),
}

local api = require("rocks.api")

---@class RocksTreesitterOpts
---@field auto_highlight? string[] | "all" Parsers to automatically enable syntax highlighting for. Note that these are parser languages, not file types. Defaults to an empty list.
---@field auto_install? boolean | "prompt" Auto-install parsers in `auto_highlight` as needed? Default: 'prompt'
---@field parser_map? table<string, string> Map from filetypes to parser languages

local toml_config = api.get_rocks_toml()["treesitter"]
---@type RocksTreesitterOpts
local lua_config = vim.g.rocks_nvim and vim.g.rocks_nvim.treesitter

---@type RocksTreesitterOpts
local opts = {}

if type(toml_config) == "table" then
    opts = vim.tbl_deep_extend("force", opts, toml_config)
end
if type(lua_config) == "table" then
    opts = vim.tbl_deep_extend("force", opts, lua_config)
end

--- Map opts to configs, preserving defaults if not set
config.auto_highlight = opts.auto_highlight == "all" and "all"
    or vim.iter(opts.auto_highlight or {}):fold({}, function(acc, lang)
        ---@cast lang string
        acc[lang] = true
        return acc
    end)
config.auto_install = opts.auto_install ~= nil and opts.auto_install or config.auto_install
config.parser_map = vim.tbl_extend("force", config.parser_map or opts.parser_map or {})

return config
