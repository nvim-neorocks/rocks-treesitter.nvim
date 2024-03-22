local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-treesitter.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "rocks.nvim >= 1.19.0",
}

source = {
    url = "git://github.com/nvim-neorocks/" .. package,
}

build = {
    type = "builtin",
    copy_directories = {
        "plugin",
    },
}
