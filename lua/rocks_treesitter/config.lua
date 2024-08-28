---@mod rocks_treesitter.config

---@package
---@class RocksTreesitterConfig
local config = {
    ---@type boolean | "prompt"
    auto_install = "prompt",
    ---@type "all" | table<string, boolean>
    auto_highlight = {},
    ---@type table<string, boolean> | fun(lang: string, bufnr: integer):boolean
    disable = {},
    ---@type table<string, string>
    parser_map = require("rocks_treesitter.ft_parser_map"),
}

local api = require("rocks.api")

---@class RocksTreesitterOpts
---
--- Parsers to automatically enable syntax highlighting for.
--- Note that these are parser languages, not file types.
--- Defaults to an empty list.
---@field auto_highlight? string[] | "all"
---
--- Auto-install parsers in `auto_highlight` as needed?
--- Default: 'prompt'
---@field auto_install? boolean | "prompt"
---
--- Map from filetypes to parser languages
---@field parser_map? table<string, string>
---
--- File types to disable highlighting for (lua + toml config)
--- or a function to conditionally disable highlighting (lua only)
---@field disable? string[] | fun(lang: string, bufnr: integer):boolean

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

---@generic T
---@param lst? T[]
---@return table<T, boolean>
local function list_to_bool_map(lst)
    return vim
        .iter(lst or {})
        ---@generic T
        ---@param acc table<T, boolean>
        ---@param val T
        :fold(
            {},
            function(acc, val)
                acc[val] = true
                return acc
            end
        )
end

--- Map opts to configs, preserving defaults if not set
config.auto_highlight = opts.auto_highlight == "all" and "all"
    ---@diagnostic disable-next-line: param-type-mismatch
    or list_to_bool_map(opts.auto_highlight)
config.disable = type(opts.disable) == "function" and opts.disable
    ---@diagnostic disable-next-line: param-type-mismatch
    or list_to_bool_map(opts.disable)
---@diagnostic disable-next-line: assign-type-mismatch
config.auto_install = vim.F.if_nil(opts.auto_install, config.auto_install)
config.parser_map = vim.tbl_extend("force", config.parser_map, opts.parser_map or {})

return config
