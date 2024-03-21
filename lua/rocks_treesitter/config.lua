---@mod rocks_treesitter.config

---@package
---@class RocksTreesitterConfig
local config = {
    ---@type boolean | "prompt"
    auto_install = "prompt",
    ---@type "all" | { [string]: boolean? }
    auto_highlight = {},
}

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

return config
