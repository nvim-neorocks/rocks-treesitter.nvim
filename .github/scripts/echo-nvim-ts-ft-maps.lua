#!/usr/bin/env -S nvim -u NONE -U NONE -N -i NONE -l

vim.opt.rtp:append(vim.fs.joinpath(vim.fn.getcwd(), "nvim-treesitter"))

local parser_configs = require("nvim-treesitter.parsers").configs
for lang, config in pairs(parser_configs) do
    config.lang = lang
end
local parser_map = vim.iter(parser_configs)
    :filter(function(config)
        return config.filetype ~= nil
    end)
    :fold({}, function(acc, config)
        acc[config.filetype] = config.lang
        return acc
    end)

local mod = ([==[
---@mod rocks_treesitter.ft_parser_map
---@brief [[
---
---This module is generated. Do not edit by hand!
---
---@brief ]]

return %s
]==]):format(vim.inspect(parser_map))

io.write(mod)
