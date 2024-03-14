<!-- markdownlint-disable -->
<br />
<div align="center">
  <a href="https://github.com/nvim-neorocks/rocks-treesitter.nvim">
    <img src="./rocks-header.svg" alt="rocks-treesitter.nvim">
  </a>
  <p align="center">
    <!-- <br /> -->
    <!-- <a href="./doc/rocks-treesitter.txt"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <br />
    <a href="https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/new?assignees=&labels=bug">Report Bug</a>
    ·
    <a href="https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/new?assignees=&labels=enhancement">Request Feature</a>
    ·
    <a href="https://github.com/nvim-neorocks/rocks.nvim/discussions/new?category=q-a">Ask Question</a>
  </p>
  <p>
    <strong>
      A "just works" tree-sitter setup for <a href="https://github.com/nvim-neorocks/rocks.nvim/">rocks.nvim</a>! 
    </strong>
  </p>
</div>
<!-- markdownlint-restore -->

[![LuaRocks][luarocks-shield]][luarocks-url]

## :star2: Summary

`rocks-treesitter.nvim` is a wrapper around [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
that comes with all parsers that are available on [rocks-binaries](https://nvim-neorocks.github.io/rocks-binaries/).

### Do I need this plugin?

No. Plugins that depend on tree-sitter parsers can specify
the dependencies in their rockspecs.

You can also install nvim-treesitter and set it up as you are used to.
Instead of passing `ensure_installed` to the `setup` function,
or using `:TSInstall <lang>`, you can run `:Rocks install tree-sitter-<lang>`.
See also the [rocks.nvim README's tree-sitter section](https://github.com/nvim-neorocks/rocks.nvim?tab=readme-ov-file#deciduous_tree-enhanced-tree-sitter-support).

This plugin is simply for convenience.
Installing this plugin automatically installs nvim-treesitter and
all parsers that don't need their sources to be generated
using the `tree-sitter-cli` as dependencies,
and sets up nvim-treesitter with syntax highlighting enabled
by default.

## :pencil: Requirements

- An up-to-date `rocks.nvim`.

## :hammer: Installation

Simply run `:Rocks install rocks-treesitter.nvim`,
and you are good to go!

## :books: Usage

This plugin works out of the box and doesn't need any configuration.
However, you can override its default configuration in one of two ways:

### Using rocks.toml

You can add a `[rocks-treesitter]` section to your rocks.toml,
and use it to set any options you would otherwise pass to
`require("nvim-treesitter.configs").setup {}`[^1].

[^1]: See [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for configuration options.

```toml
[rocks-treesitter]
dont_remove_install_commands = false
# Other nvim-treesitter configs
```

### With lua:

Or, you add a lua table to your `vim.g.rocks_nvim` setting:

```lua
vim.g.rocks_nvim = {
    -- rocks.nvim config
    rocks_treesitter = {
        -- tree-sitter configs here
    },
}
```

> [!IMPORTANT]
>
> If both configuration methods are used, the
> lua configuration is given higher priority,
> to support things like `:h exrc`.

## :book: License

`rocks-treesitter.nvim` is licensed under [GPLv3](./LICENSE).

[luarocks-shield]: https://img.shields.io/luarocks/v/neorocks/rocks-treesitter.nvim?logo=lua&color=purple&style=for-the-badge
[luarocks-url]: https://luarocks.org/modules/neorocks/rocks-treesitter.nvim
