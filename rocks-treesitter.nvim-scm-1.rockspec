local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
package = "rocks-treesitter.nvim"
version = _MODREV .. _SPECREV

dependencies = {
    "lua >= 5.1",
    "nvim-treesitter",
    -- generated dependencies from rocks-binaries
    "tree-sitter-ninja", "tree-sitter-eds", "tree-sitter-nix", "tree-sitter-eex", "tree-sitter-nqc",
    "tree-sitter-elixir", "tree-sitter-objc", "tree-sitter-elm", "tree-sitter-objdump", "tree-sitter-elsa",
    "tree-sitter-elvish", "tree-sitter-embedded_template", "tree-sitter-odin", "tree-sitter-erlang", "tree-sitter-org",
    "tree-sitter-facility", "tree-sitter-pem", "tree-sitter-fennel", "tree-sitter-php", "tree-sitter-firrtl",
    "tree-sitter-fish", "tree-sitter-foam", "tree-sitter-forth", "tree-sitter-fortran", "tree-sitter-poe_filter",
    "tree-sitter-csv", "tree-sitter-tsv", "tree-sitter-cuda", "tree-sitter-gdscript", "tree-sitter-cue",
    "tree-sitter-properties", "tree-sitter-git_rebase", "tree-sitter-devicetree", "tree-sitter-gitattributes", "tree-sitter-dhall",
    "tree-sitter-prql", "tree-sitter-gitignore", "tree-sitter-psv", "tree-sitter-pug", "tree-sitter-glimmer",
    "tree-sitter-puppet", "tree-sitter-purescript", "tree-sitter-diff", "tree-sitter-pymanifest", "tree-sitter-json",
    "tree-sitter-vim", "tree-sitter-ql", "tree-sitter-qmldir", "tree-sitter-godot_resource", "tree-sitter-qmljs",
    "tree-sitter-query", "tree-sitter-gomod", "tree-sitter-gosum", "tree-sitter-gowork", "tree-sitter-racket",
    "tree-sitter-graphql", "tree-sitter-lua", "tree-sitter-rbs", "tree-sitter-gpg", "tree-sitter-gstlaunch",
    "tree-sitter-rego", "tree-sitter-hack", "tree-sitter-requirements", "tree-sitter-haskell", "tree-sitter-rnoweb",
    "tree-sitter-haskell_persistent", "tree-sitter-robot", "tree-sitter-hcl", "tree-sitter-ron", "tree-sitter-heex",
    "tree-sitter-rust", "tree-sitter-scala", "tree-sitter-hlsl", "tree-sitter-scheme", "tree-sitter-squirrel",
    "tree-sitter-scss", "tree-sitter-ssh_config", "tree-sitter-slang", "tree-sitter-starlark", "tree-sitter-strace",
    "tree-sitter-styled", "tree-sitter-http", "tree-sitter-supercollider", "tree-sitter-hurl", "tree-sitter-surface",
    "tree-sitter-smithy", "tree-sitter-svelte", "tree-sitter-soql", "tree-sitter-sxhkdrc", "tree-sitter-janet_simple",
    "tree-sitter-systemtap", "tree-sitter-sparql", "tree-sitter-java", "tree-sitter-javascript", "tree-sitter-tablegen",
    "tree-sitter-jsdoc", "tree-sitter-templ", "tree-sitter-json5", "tree-sitter-terraform", "tree-sitter-proto",
    "tree-sitter-textproto", "tree-sitter-jsonnet", "tree-sitter-thrift", "tree-sitter-julia", "tree-sitter-tiger",
    "tree-sitter-kconfig", "tree-sitter-tlaplus", "tree-sitter-kotlin", "tree-sitter-kusto", "tree-sitter-todotxt",
    "tree-sitter-lalrpop", "tree-sitter-toml", "tree-sitter-tsx", "tree-sitter-typescript", "tree-sitter-turtle",
    "tree-sitter-twig", "tree-sitter-typoscript", "tree-sitter-llvm", "tree-sitter-linkerscript", "tree-sitter-udev",
    "tree-sitter-ungrammar", "tree-sitter-func", "tree-sitter-c", "tree-sitter-usd", "tree-sitter-uxntal",
    "tree-sitter-vala", "tree-sitter-verilog", "tree-sitter-vhs", "tree-sitter-vimdoc", "tree-sitter-vue",
    "tree-sitter-wgsl", "tree-sitter-wgsl_bevy", "tree-sitter-xcompose", "tree-sitter-yaml", "tree-sitter-yang",
    "tree-sitter-yuck", "tree-sitter-zig", "tree-sitter-ada", "tree-sitter-agda", "tree-sitter-html",
    "tree-sitter-apex", "tree-sitter-arduino", "tree-sitter-cpp", "tree-sitter-authzed", "tree-sitter-awk",
    "tree-sitter-bash", "tree-sitter-bass", "tree-sitter-bibtex", "tree-sitter-bicep", "tree-sitter-bitbake",
    "tree-sitter-c_sharp", "tree-sitter-cairo", "tree-sitter-capnp", "tree-sitter-chatito", "tree-sitter-clojure",
    "tree-sitter-cmake", "tree-sitter-comment", "tree-sitter-commonlisp", "tree-sitter-corn", "tree-sitter-cpon",
    "tree-sitter-css", "tree-sitter-v", "tree-sitter-hjson", "tree-sitter-ebnf", "tree-sitter-gn",
    "tree-sitter-doxygen", "tree-sitter-hare", "tree-sitter-glsl", "tree-sitter-dockerfile", "tree-sitter-hoon",
    "tree-sitter-ruby", "tree-sitter-slint", "tree-sitter-gleam", "tree-sitter-solidity", "tree-sitter-ini",
    "tree-sitter-jq", "tree-sitter-pascal", "tree-sitter-po", "tree-sitter-kdl", "tree-sitter-gitcommit",
    "tree-sitter-liquidsoap", "tree-sitter-git_config", "tree-sitter-regex", "tree-sitter-passwd", "tree-sitter-luadoc",
    "tree-sitter-promql", "tree-sitter-luap", "tree-sitter-ocaml_interface", "tree-sitter-leo", "tree-sitter-luau",
    "tree-sitter-ledger", "tree-sitter-m68k", "tree-sitter-latex", "tree-sitter-phpdoc", "tree-sitter-make",
    "tree-sitter-prisma", "tree-sitter-markdown", "tree-sitter-python", "tree-sitter-rasi", "tree-sitter-re2c",
    "tree-sitter-markdown_inline", "tree-sitter-sosl", "tree-sitter-ispc", "tree-sitter-matlab", "tree-sitter-menhir",
    "tree-sitter-snakemake", "tree-sitter-htmldjango", "tree-sitter-mermaid", "tree-sitter-meson", "tree-sitter-hocon",
    "tree-sitter-rst", "tree-sitter-go", "tree-sitter-dot", "tree-sitter-nasm", "tree-sitter-r",
    "tree-sitter-pony", "tree-sitter-nim", "tree-sitter-fsh", "tree-sitter-pioasm", "tree-sitter-nim_format_string",
    "tree-sitter-ocaml", 
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
