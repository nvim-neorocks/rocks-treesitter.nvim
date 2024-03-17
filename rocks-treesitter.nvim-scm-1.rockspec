local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-treesitter.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "nvim-treesitter",
    -- generated dependencies from rocks-binaries
    "tree-sitter-vue", "tree-sitter-yaml", "tree-sitter-yuck", "tree-sitter-html", "tree-sitter-apex",
    "tree-sitter-arduino", "tree-sitter-smithy", "tree-sitter-soql", "tree-sitter-sosl", "tree-sitter-sparql",
    "tree-sitter-squirrel", "tree-sitter-starlark", "tree-sitter-supercollider", "tree-sitter-surface", "tree-sitter-svelte",
    "tree-sitter-tablegen", "tree-sitter-thrift", "tree-sitter-gitattributes", "tree-sitter-markdown_inline", "tree-sitter-tiger",
    "tree-sitter-tlaplus", "tree-sitter-menhir", "tree-sitter-gleam", "tree-sitter-meson", "tree-sitter-toml",
    "tree-sitter-tsx", "tree-sitter-typescript", "tree-sitter-turtle", "tree-sitter-twig", "tree-sitter-typoscript",
    "tree-sitter-nim", "tree-sitter-godot_resource", "tree-sitter-udev", "tree-sitter-nqc", "tree-sitter-usd",
    "tree-sitter-uxntal", "tree-sitter-gpg", "tree-sitter-odin", "tree-sitter-hare", "tree-sitter-pascal",
    "tree-sitter-haskell", "tree-sitter-vimdoc", "tree-sitter-pem", "tree-sitter-heex", "tree-sitter-hoon",
    "tree-sitter-poe_filter", "tree-sitter-http", "tree-sitter-hurl", "tree-sitter-prisma", "tree-sitter-properties",
    "tree-sitter-ini", "tree-sitter-ispc", "tree-sitter-janet_simple", "tree-sitter-java", "tree-sitter-javascript",
    "tree-sitter-puppet", "tree-sitter-jsdoc", "tree-sitter-pymanifest", "tree-sitter-python", "tree-sitter-qmljs",
    "tree-sitter-query", "tree-sitter-kconfig", "tree-sitter-kdl", "tree-sitter-rasi", "tree-sitter-rbs",
    "tree-sitter-latex", "tree-sitter-bash", "tree-sitter-leo", "tree-sitter-bass", "tree-sitter-linkerscript",
    "tree-sitter-bicep", "tree-sitter-ron", "tree-sitter-bitbake", "tree-sitter-luadoc", "tree-sitter-luap",
    "tree-sitter-rust", "tree-sitter-c_sharp", "tree-sitter-scala", "tree-sitter-m68k", "tree-sitter-cairo",
    "tree-sitter-scheme", "tree-sitter-chatito", "tree-sitter-markdown", "tree-sitter-clojure", "tree-sitter-slang",
    "tree-sitter-cmake", "tree-sitter-comment", "tree-sitter-commonlisp", "tree-sitter-cpon", "tree-sitter-css",
    "tree-sitter-csv", "tree-sitter-tsv", "tree-sitter-cuda", "tree-sitter-devicetree", "tree-sitter-dockerfile",
    "tree-sitter-julia", "tree-sitter-psv", "tree-sitter-doxygen", "tree-sitter-racket", "tree-sitter-vim",
    "tree-sitter-func", "tree-sitter-eex", "tree-sitter-elixir", "tree-sitter-elm", "tree-sitter-objdump",
    "tree-sitter-elsa", "tree-sitter-objc", "tree-sitter-json", "tree-sitter-glimmer", "tree-sitter-lua",
    "tree-sitter-embedded_template", "tree-sitter-gosum", "tree-sitter-erlang", "tree-sitter-gomod", "tree-sitter-glsl",
    "tree-sitter-gn", "tree-sitter-go", "tree-sitter-fennel", "tree-sitter-c", "tree-sitter-gitcommit",
    "tree-sitter-luau", "tree-sitter-php", "tree-sitter-pony", "tree-sitter-foam", "tree-sitter-ql",
    "tree-sitter-requirements", "tree-sitter-ruby", "tree-sitter-scss", "tree-sitter-rst", "tree-sitter-regex",
    "tree-sitter-qmldir", "tree-sitter-purescript", "tree-sitter-gdscript", "tree-sitter-capnp", 
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
