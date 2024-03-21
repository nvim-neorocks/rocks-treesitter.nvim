if vim.g.did_load_rocks_treesitter then
    return
end

local config = require("rocks_treesitter.config")

if config.auto_highlight == "all" or not vim.tbl_isempty(config.auto_highlight) then
    require("rocks_treesitter.highlight").create_autocmd()
end

vim.g.did_load_rocks_treesitter = true
