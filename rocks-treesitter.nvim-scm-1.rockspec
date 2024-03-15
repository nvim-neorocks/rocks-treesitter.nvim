local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-treesitter.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "nvim-treesitter",
    -- generated dependencies from rocks-binaries
    "tree-sitter-gitattributes", "tree-sitter-gitcommit", "tree-sitter-git_config", "tree-sitter-gitignore", "tree-sitter-julia",
    "tree-sitter-kconfig", "tree-sitter-kdl", "tree-sitter-kotlin", "tree-sitter-qmljs", "tree-sitter-gn",
    "tree-sitter-kusto", "tree-sitter-prisma", "tree-sitter-rbs", "tree-sitter-lalrpop", "tree-sitter-godot_resource",
    "tree-sitter-regex", "tree-sitter-properties", "tree-sitter-bash", "tree-sitter-ledger", "tree-sitter-diff",
    "tree-sitter-requirements", "tree-sitter-gosum", "tree-sitter-robot", "tree-sitter-gowork", "tree-sitter-llvm",
    "tree-sitter-func", "tree-sitter-c", "tree-sitter-linkerscript", "tree-sitter-latex", "tree-sitter-liquidsoap",
    "tree-sitter-graphql", "tree-sitter-markdown", "tree-sitter-pymanifest", "tree-sitter-gstlaunch", "tree-sitter-luadoc",
    "tree-sitter-ini", "tree-sitter-luap", "tree-sitter-hare", "tree-sitter-luau", "tree-sitter-go",
    "tree-sitter-m68k", "tree-sitter-lua", "tree-sitter-snakemake", "tree-sitter-ruby", "tree-sitter-make",
    "tree-sitter-ada", "tree-sitter-smithy", "tree-sitter-r", "tree-sitter-heex", "tree-sitter-proto",
    "tree-sitter-hjson", "tree-sitter-markdown_inline", "tree-sitter-rasi", "tree-sitter-agda", "tree-sitter-matlab",
    "tree-sitter-hocon", "tree-sitter-menhir", "tree-sitter-hoon", "tree-sitter-squirrel", "tree-sitter-mermaid",
    "tree-sitter-apex", "tree-sitter-meson", "tree-sitter-slang", "tree-sitter-http", "tree-sitter-arduino",
    "tree-sitter-hurl", "tree-sitter-nasm", "tree-sitter-ispc", "tree-sitter-nim", "tree-sitter-authzed",
    "tree-sitter-janet_simple", "tree-sitter-nim_format_string", "tree-sitter-awk", "tree-sitter-ninja", "tree-sitter-java",
    "tree-sitter-svelte", "tree-sitter-bass", "tree-sitter-solidity", "tree-sitter-jq", "tree-sitter-jsdoc",
    "tree-sitter-bibtex", "tree-sitter-systemtap", "tree-sitter-scss", "tree-sitter-sosl", "tree-sitter-nqc",
    "tree-sitter-bicep", "tree-sitter-objc", "tree-sitter-bitbake", "tree-sitter-objdump", "tree-sitter-ocaml",
    "tree-sitter-terraform", "tree-sitter-c_sharp", "tree-sitter-ocaml_interface", "tree-sitter-sparql", "tree-sitter-starlark",
    "tree-sitter-cairo", "tree-sitter-vim", "tree-sitter-capnp", "tree-sitter-tiger", "tree-sitter-chatito",
    "tree-sitter-supercollider", "tree-sitter-clojure", "tree-sitter-verilog", "tree-sitter-tablegen", "tree-sitter-cmake",
    "tree-sitter-v", "tree-sitter-pem", "tree-sitter-comment", "tree-sitter-toml", "tree-sitter-commonlisp",
    "tree-sitter-tsv", "tree-sitter-php", "tree-sitter-tsx", "tree-sitter-phpdoc", "tree-sitter-twig",
    "tree-sitter-corn", "tree-sitter-pioasm", "tree-sitter-typoscript", "tree-sitter-cpon", "tree-sitter-turtle",
    "tree-sitter-cpp", "tree-sitter-css", "tree-sitter-ungrammar", "tree-sitter-csv", "tree-sitter-udev",
    "tree-sitter-cuda", "tree-sitter-typescript", "tree-sitter-cue", "tree-sitter-usd", "tree-sitter-uxntal",
    "tree-sitter-todotxt", "tree-sitter-tlaplus", "tree-sitter-thrift", "tree-sitter-devicetree", "tree-sitter-textproto",
    "tree-sitter-vala", "tree-sitter-dhall", "tree-sitter-sxhkdrc", "tree-sitter-surface", "tree-sitter-vhs",
    "tree-sitter-dockerfile", "tree-sitter-styled", "tree-sitter-strace", "tree-sitter-dot", "tree-sitter-vimdoc",
    "tree-sitter-ssh_config", "tree-sitter-doxygen", "tree-sitter-vue", "tree-sitter-wgsl", "tree-sitter-soql",
    "tree-sitter-ebnf", "tree-sitter-wgsl_bevy", "tree-sitter-slint", "tree-sitter-eds", "tree-sitter-scheme",
    "tree-sitter-scala", "tree-sitter-rust", "tree-sitter-xcompose", "tree-sitter-rst", "tree-sitter-ron",
    "tree-sitter-yaml", "tree-sitter-rnoweb", "tree-sitter-yang", "tree-sitter-rego", "tree-sitter-yuck",
    "tree-sitter-re2c", "tree-sitter-zig", "tree-sitter-racket", "tree-sitter-query", "tree-sitter-templ",
    "tree-sitter-qmldir", "tree-sitter-ql", "tree-sitter-python", "tree-sitter-purescript", "tree-sitter-puppet",
    "tree-sitter-pug", "tree-sitter-eex", "tree-sitter-psv", "tree-sitter-prql", "tree-sitter-promql",
    "tree-sitter-elixir", "tree-sitter-pony", "tree-sitter-elm", "tree-sitter-poe_filter", "tree-sitter-elsa",
    "tree-sitter-po", "tree-sitter-passwd", "tree-sitter-elvish", "tree-sitter-pascal", "tree-sitter-org",
    "tree-sitter-embedded_template", "tree-sitter-odin", "tree-sitter-erlang", "tree-sitter-norg", "tree-sitter-nix",
    "tree-sitter-facility", "tree-sitter-hack", "tree-sitter-json5", "tree-sitter-fennel", "tree-sitter-htmldjango",
    "tree-sitter-firrtl", "tree-sitter-fish", "tree-sitter-haskell_persistent", "tree-sitter-gomod", "tree-sitter-foam",
    "tree-sitter-glimmer", "tree-sitter-gleam", "tree-sitter-forth", "tree-sitter-glsl", "tree-sitter-fortran",
    "tree-sitter-gpg", "tree-sitter-fsh", "tree-sitter-hcl", "tree-sitter-hlsl", "tree-sitter-html",
    "tree-sitter-javascript", "tree-sitter-gdscript", "tree-sitter-haskell", "tree-sitter-leo", "tree-sitter-json",
    "tree-sitter-jsonnet", "tree-sitter-git_rebase", 
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
