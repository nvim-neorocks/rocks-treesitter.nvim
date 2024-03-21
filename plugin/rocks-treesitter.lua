if vim.g.did_load_rocks_treesitter then
    return
end

local config = require("rocks_treesitter.config")

local auto_highlight = config.auto_highlight
if
    auto_highlight == "all"
    ---@cast auto_highlight { [string]: boolean }
    or next(auto_highlight)
then
    require("rocks_treesitter.highlight").create_autocmd(config)
end

vim.g.did_load_rocks_treesitter = true
