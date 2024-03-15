local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-treesitter.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "nvim-treesitter",
    -- generated dependencies from rocks-binaries
    "tree-sitter-soql", "tree-sitter-haskell_persistent", "tree-sitter-c_sharp", "tree-sitter-cairo", "tree-sitter-capnp",
    "tree-sitter-chatito", "tree-sitter-clojure", "tree-sitter-starlark", "tree-sitter-cmake", "tree-sitter-strace",
    "tree-sitter-comment", "tree-sitter-templ", "tree-sitter-commonlisp", "tree-sitter-zig", "tree-sitter-sosl",
    "tree-sitter-surface", "tree-sitter-squirrel", "tree-sitter-svelte", "tree-sitter-hcl", "tree-sitter-ssh_config",
    "tree-sitter-cpon", "tree-sitter-sxhkdrc", "tree-sitter-cpp", "tree-sitter-css", "tree-sitter-hlsl",
    "tree-sitter-csv", "tree-sitter-hocon", "tree-sitter-cuda", "tree-sitter-xcompose", "tree-sitter-cue",
    "tree-sitter-systemtap", "tree-sitter-wgsl_bevy", "tree-sitter-htmldjango", "tree-sitter-http", "tree-sitter-textproto",
    "tree-sitter-devicetree", "tree-sitter-wgsl", "tree-sitter-thrift", "tree-sitter-json", "tree-sitter-ispc",
    "tree-sitter-tiger", "tree-sitter-vue", "tree-sitter-janet_simple", "tree-sitter-tlaplus", "tree-sitter-dockerfile",
    "tree-sitter-vimdoc", "tree-sitter-java", "tree-sitter-dot", "tree-sitter-todotxt", "tree-sitter-vim",
    "tree-sitter-doxygen", "tree-sitter-jq", "tree-sitter-jsdoc", "tree-sitter-vhs", "tree-sitter-ebnf",
    "tree-sitter-json5", "tree-sitter-lua", "tree-sitter-twig", "tree-sitter-typescript", "tree-sitter-eex",
    "tree-sitter-puppet", "tree-sitter-jsonnet", "tree-sitter-udev", "tree-sitter-julia", "tree-sitter-turtle",
    "tree-sitter-kconfig", "tree-sitter-scheme", "tree-sitter-kdl", "tree-sitter-elsa", "tree-sitter-kotlin",
    "tree-sitter-usd", "tree-sitter-elvish", "tree-sitter-kusto", "tree-sitter-uxntal", "tree-sitter-embedded_template",
    "tree-sitter-lalrpop", "tree-sitter-erlang", "tree-sitter-ungrammar", "tree-sitter-typoscript", "tree-sitter-ledger",
    "tree-sitter-vala", "tree-sitter-tsx", "tree-sitter-leo", "tree-sitter-fennel", "tree-sitter-tsv",
    "tree-sitter-llvm", "tree-sitter-toml", "tree-sitter-fish", "tree-sitter-linkerscript", "tree-sitter-terraform",
    "tree-sitter-foam", "tree-sitter-liquidsoap", "tree-sitter-forth", "tree-sitter-tablegen", "tree-sitter-fortran",
    "tree-sitter-luadoc", "tree-sitter-fsh", "tree-sitter-luap", "tree-sitter-luau", "tree-sitter-supercollider",
    "tree-sitter-m68k", "tree-sitter-styled", "tree-sitter-func", "tree-sitter-c", "tree-sitter-make",
    "tree-sitter-yaml", "tree-sitter-proto", "tree-sitter-yang", "tree-sitter-sparql", "tree-sitter-yuck",
    "tree-sitter-solidity", "tree-sitter-markdown_inline", "tree-sitter-hoon", "tree-sitter-haskell", "tree-sitter-matlab",
    "tree-sitter-slint", "tree-sitter-menhir", "tree-sitter-slang", "tree-sitter-gomod", "tree-sitter-mermaid",
    "tree-sitter-v", "tree-sitter-meson", "tree-sitter-firrtl", "tree-sitter-objc", "tree-sitter-bass",
    "tree-sitter-nasm", "tree-sitter-ruby", "tree-sitter-rst", "tree-sitter-nim", "tree-sitter-robot",
    "tree-sitter-nim_format_string", "tree-sitter-rnoweb", "tree-sitter-ninja", "tree-sitter-requirements", "tree-sitter-rego",
    "tree-sitter-nix", "tree-sitter-regex", "tree-sitter-phpdoc", "tree-sitter-norg", "tree-sitter-rbs",
    "tree-sitter-properties", "tree-sitter-rasi", "tree-sitter-bitbake", "tree-sitter-r", "tree-sitter-query",
    "tree-sitter-nqc", "tree-sitter-qmljs", "tree-sitter-javascript", "tree-sitter-psv", "tree-sitter-objdump",
    "tree-sitter-pug", "tree-sitter-bash", "tree-sitter-ocaml", "tree-sitter-ql", "tree-sitter-purescript",
    "tree-sitter-html", "tree-sitter-python", "tree-sitter-pymanifest", "tree-sitter-glimmer", "tree-sitter-odin",
    "tree-sitter-verilog", "tree-sitter-org", "tree-sitter-latex", "tree-sitter-pascal", "tree-sitter-qmldir",
    "tree-sitter-markdown", "tree-sitter-passwd", "tree-sitter-prql", "tree-sitter-pem", "tree-sitter-ini",
    "tree-sitter-promql", "tree-sitter-gdscript", "tree-sitter-hjson", "tree-sitter-php", "tree-sitter-racket",
    "tree-sitter-scala", "tree-sitter-git_rebase", "tree-sitter-po", "tree-sitter-gitattributes", "tree-sitter-pioasm",
    "tree-sitter-gitcommit", "tree-sitter-re2c", "tree-sitter-git_config", "tree-sitter-ocaml_interface", "tree-sitter-poe_filter",
    "tree-sitter-gitignore", "tree-sitter-agda", "tree-sitter-gleam", "tree-sitter-pony", "tree-sitter-heex",
    "tree-sitter-prisma", "tree-sitter-elixir", "tree-sitter-glsl", "tree-sitter-apex", "tree-sitter-gn",
    "tree-sitter-ron", "tree-sitter-bibtex", "tree-sitter-arduino", "tree-sitter-diff", "tree-sitter-godot_resource",
    "tree-sitter-rust", "tree-sitter-bicep", "tree-sitter-go", "tree-sitter-authzed", "tree-sitter-gosum",
    "tree-sitter-awk", "tree-sitter-gowork", "tree-sitter-scss", "tree-sitter-facility", "tree-sitter-gpg",
    "tree-sitter-ada", "tree-sitter-elm", "tree-sitter-dhall", "tree-sitter-graphql", "tree-sitter-eds",
    "tree-sitter-snakemake", "tree-sitter-gstlaunch", "tree-sitter-hurl", "tree-sitter-hack", "tree-sitter-smithy",
    "tree-sitter-hare", "tree-sitter-corn", 
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
