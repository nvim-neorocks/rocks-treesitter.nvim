if vim.g.did_load_rocks_reesitter then
    return
end

local api = require("rocks.api")

local default_config = {
    ensure_installed = {},
    auto_install = false,
    highlight = {
        enable = true,
    },
}

local config

local toml_config = api.get_rocks_toml()
if type(toml_config["rocks-treesitter"]) == "table" then
    config = vim.tbl_deep_extend("force", default_config, toml_config["rocks-treesitter"])
end

config = vim.tbl_deep_extend("force", config or default_config, vim.g.rocks_treesitter or {})

local ts_configs = require("nvim-treesitter.configs")
if config.auto_install then
    local treesitter_path = package.searchpath("nvim-treesitter", package.path)
    local parser_install_dir = ts_configs.get_parser_install_dir()
    if treesitter_path and parser_install_dir and treesitter_path:find(parser_install_dir) then
        vim.notify(
            "nvim-treesitter is configured to auto-install parsers, but the 'parser_install_dir' is not set correctly.",
            vim.log.levels.ERROR
        )
    end
end
ts_configs.setup(config)

vim.cmd.Rocks({ "packadd", "nvim-treesitter" })

if not config.dont_remove_install_commands then
    pcall(vim.api.nvim_del_user_command, "TSInstall")
    pcall(vim.api.nvim_del_user_command, "TSInstallFromGrammar")
    pcall(vim.api.nvim_del_user_command, "TSInstallSync")
    pcall(vim.api.nvim_del_user_command, "TSUninstall")
    pcall(vim.api.nvim_del_user_command, "TSUpdate")
    pcall(vim.api.nvim_del_user_command, "TSUpdateSync")
end

vim.g.did_load_rocks_reesitter = true
