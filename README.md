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
      A WIP "just works" tree-sitter setup for <a href="https://github.com/nvim-neorocks/rocks.nvim/">rocks.nvim</a>!
    </strong>
  </p>
</div>
<!-- markdownlint-restore -->

[![LuaRocks][luarocks-shield]][luarocks-url]

> [!WARNING]
>
> **We are not affiliated with the nvim-treesitter maintainers.
> If you are facing issues with tree-sitter support in rocks.nvim,
> please don't bug them.**

## :star2: Summary

`rocks-treesitter.nvim` is a rocks.nvim module that helps you manage
and use [tree-sitter](https://neovim.io/doc/user/treesitter.html) parsers.

It aims to be a minimal replacement for [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

Parsers, bundled with queries, are hosted on [rocks-binaries](https://nvim-neorocks.github.io/rocks-binaries/)
and [rocks-binaries-dev](https://nvim-neorocks.github.io/rocks-binaries-dev/),
so that you don't have to compile them on your machine.

### Do I need this plugin?

No. Plugins that depend on tree-sitter parsers can specify
the dependencies in their rockspecs.

You can also install the parsers manually, using `:Rocks install tree-sitter-<lang>`.
To enable highlighting for parser `<lang>`, all you need to do is create a
`ftplugin/<lang>.lua` file, and in it, call `vim.treesitter.start()`.

See also the [rocks.nvim README's tree-sitter section](https://github.com/nvim-neorocks/rocks.nvim?tab=readme-ov-file#deciduous_tree-enhanced-tree-sitter-support).

This plugin is for convenience.

## :pencil: Requirements

- An up-to-date `rocks.nvim`.

## :hammer: Installation

Simply run `:Rocks install rocks-treesitter.nvim`,
and you are good to go!

## :books: Usage

This plugin works out of the box and doesn't need any configuration.
However, you can override its default configuration in one of two ways:

- In rocks.toml
- With a Lua config

## :wrench: Configuration

### Using rocks.toml

You can add a `[treesitter]` section to your rocks.toml,
and use it to configure this plugin.

```toml
[treesitter]
# auto_highlight = "all"
# NOTE: These are parsers, not filetypes.
auto_highlight = [
  "haskell",
  "dhall",
  "rust",
  "toml"
]
auto_install = "prompt" # true | false
# NOTE: These are filetypes
disable = [
  "lhaskell"
]

[treesitter.parser_map]
# You can add custom filetype to parser mappings.
# Determine the filetype with ':lua =vim.bo[0].filetype'.
# NOTE: You don't actually have to add these examples.
# They are added by default.
PKGBUILD = "bash"
cls = "latex"
sty = "latex"
```

### With lua:

Or, you add a lua table to your `vim.g.rocks_nvim` setting:

```lua
vim.g.rocks_nvim = {
    -- rocks.nvim config
    treesitter = {
        auto_highlight = { },
        auto_install = "prompt",
        parser_map = { },
        ---@type string[] | fun(lang: string, bufnr: integer):boolean
        disable = { }, -- filetypes or a function
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
