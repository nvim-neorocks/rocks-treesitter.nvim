local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-treesitter.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "nvim-treesitter",
    -- generated dependencies from rocks-binaries
    "tree-sitter-zig", "tree-sitter-scheme", "tree-sitter-scss", "tree-sitter-slang", "tree-sitter-func",
    "tree-sitter-c", "tree-sitter-gosum", "tree-sitter-snakemake", "tree-sitter-gowork", "tree-sitter-gpg",
    "tree-sitter-solidity", "tree-sitter-templ", "tree-sitter-soql", "tree-sitter-graphql", "tree-sitter-sparql",
    "tree-sitter-facility", "tree-sitter-gstlaunch", "tree-sitter-hack", "tree-sitter-firrtl", "tree-sitter-hare",
    "tree-sitter-elvish", "tree-sitter-haskell", "tree-sitter-javascript", "tree-sitter-vimdoc", "tree-sitter-haskell_persistent",
    "tree-sitter-xcompose", "tree-sitter-bash", "tree-sitter-strace", "tree-sitter-hcl", "tree-sitter-styled",
    "tree-sitter-html", "tree-sitter-heex", "tree-sitter-supercollider", "tree-sitter-hjson", "tree-sitter-glimmer",
    "tree-sitter-surface", "tree-sitter-hlsl", "tree-sitter-hocon", "tree-sitter-git_config", "tree-sitter-markdown",
    "tree-sitter-bibtex", "tree-sitter-sxhkdrc", "tree-sitter-vue", "tree-sitter-htmldjango", "tree-sitter-systemtap",
    "tree-sitter-http", "tree-sitter-hurl", "tree-sitter-vim", "tree-sitter-scala", "tree-sitter-ispc",
    "tree-sitter-verilog", "tree-sitter-objdump", "tree-sitter-ada", "tree-sitter-v", "tree-sitter-uxntal",
    "tree-sitter-promql", "tree-sitter-java", "tree-sitter-purescript", "tree-sitter-ungrammar", "tree-sitter-pug",
    "tree-sitter-agda", "tree-sitter-jq", "tree-sitter-typoscript", "tree-sitter-jsdoc", "tree-sitter-typescript",
    "tree-sitter-json5", "tree-sitter-twig", "tree-sitter-apex", "tree-sitter-turtle", "tree-sitter-tsx",
    "tree-sitter-arduino", "tree-sitter-jsonnet", "tree-sitter-tsv", "tree-sitter-julia", "tree-sitter-toml",
    "tree-sitter-kconfig", "tree-sitter-todotxt", "tree-sitter-kdl", "tree-sitter-tlaplus", "tree-sitter-kotlin",
    "tree-sitter-awk", "tree-sitter-nqc", "tree-sitter-kusto", "tree-sitter-thrift", "tree-sitter-bass",
    "tree-sitter-lalrpop", "tree-sitter-textproto", "tree-sitter-ninja", "tree-sitter-cpp", "tree-sitter-ledger",
    "tree-sitter-tablegen", "tree-sitter-leo", "tree-sitter-svelte", "tree-sitter-bicep", "tree-sitter-llvm",
    "tree-sitter-bitbake", "tree-sitter-starlark", "tree-sitter-linkerscript", "tree-sitter-ssh_config", "tree-sitter-ebnf",
    "tree-sitter-liquidsoap", "tree-sitter-c_sharp", "tree-sitter-squirrel", "tree-sitter-eds", "tree-sitter-sosl",
    "tree-sitter-luadoc", "tree-sitter-smithy", "tree-sitter-capnp", "tree-sitter-go", "tree-sitter-chatito",
    "tree-sitter-luau", "tree-sitter-clojure", "tree-sitter-m68k", "tree-sitter-slint", "tree-sitter-cmake",
    "tree-sitter-luap", "tree-sitter-make", "tree-sitter-comment", "tree-sitter-fish", "tree-sitter-embedded_template",
    "tree-sitter-latex", "tree-sitter-ini", "tree-sitter-markdown_inline", "tree-sitter-authzed", "tree-sitter-matlab",
    "tree-sitter-corn", "tree-sitter-fennel", "tree-sitter-menhir", "tree-sitter-cpon", "tree-sitter-commonlisp",
    "tree-sitter-mermaid", "tree-sitter-regex", "tree-sitter-meson", "tree-sitter-csv", "tree-sitter-foam",
    "tree-sitter-cuda", "tree-sitter-nasm", "tree-sitter-forth", "tree-sitter-fortran", "tree-sitter-nim",
    "tree-sitter-fsh", "tree-sitter-nim_format_string", "tree-sitter-pioasm", "tree-sitter-terraform", "tree-sitter-gdscript",
    "tree-sitter-dhall", "tree-sitter-norg", "tree-sitter-poe_filter", "tree-sitter-git_rebase", "tree-sitter-dockerfile",
    "tree-sitter-tiger", "tree-sitter-gitattributes", "tree-sitter-dot", "tree-sitter-gitcommit", "tree-sitter-prisma",
    "tree-sitter-doxygen", "tree-sitter-ocaml", "tree-sitter-gitignore", "tree-sitter-properties", "tree-sitter-gleam",
    "tree-sitter-diff", "tree-sitter-query", "tree-sitter-ocaml_interface", "tree-sitter-prql", "tree-sitter-po",
    "tree-sitter-glsl", "tree-sitter-psv", "tree-sitter-gn", "tree-sitter-pony", "tree-sitter-org",
    "tree-sitter-puppet", "tree-sitter-pascal", "tree-sitter-godot_resource", "tree-sitter-udev", "tree-sitter-passwd",
    "tree-sitter-pymanifest", "tree-sitter-pem", "tree-sitter-gomod", "tree-sitter-python", "tree-sitter-ql",
    "tree-sitter-usd", "tree-sitter-qmldir", "tree-sitter-lua", "tree-sitter-qmljs", "tree-sitter-phpdoc",
    "tree-sitter-php", "tree-sitter-proto", "tree-sitter-odin", "tree-sitter-r", "tree-sitter-vala",
    "tree-sitter-objc", "tree-sitter-racket", "tree-sitter-nix", "tree-sitter-rasi", "tree-sitter-vhs",
    "tree-sitter-eex", "tree-sitter-rbs", "tree-sitter-css", "tree-sitter-elixir", "tree-sitter-re2c",
    "tree-sitter-elm", "tree-sitter-elsa", "tree-sitter-rego", "tree-sitter-cue", "tree-sitter-wgsl",
    "tree-sitter-requirements", "tree-sitter-cairo", "tree-sitter-wgsl_bevy", "tree-sitter-rnoweb", "tree-sitter-hoon",
    "tree-sitter-robot", "tree-sitter-json", "tree-sitter-janet_simple", "tree-sitter-ron", "tree-sitter-devicetree",
    "tree-sitter-rst", "tree-sitter-yaml", "tree-sitter-ruby", "tree-sitter-yang", "tree-sitter-rust",
    "tree-sitter-yuck", "tree-sitter-erlang", 
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
