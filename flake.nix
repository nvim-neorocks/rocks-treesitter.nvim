{
  description = "A bridge to nvim-treesitter that comes with all parsers that are available on rocks-binaries";

  nixConfig = {
    extra-substituters = "https://neorocks.cachix.org";
    extra-trusted-public-keys = "neorocks.cachix.org-1:WqMESxmVTOJX7qoBC54TwrMMoVI1xAM+7yFin8NRfwk=";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    neorocks.url = "github:nvim-neorocks/neorocks";

    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";

    flake-parts.url = "github:hercules-ci/flake-parts";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    neorocks,
    gen-luarc,
    flake-parts,
    pre-commit-hooks,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem = {
        config,
        self',
        inputs',
        system,
        ...
      }: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            neorocks.overlays.default
            gen-luarc.overlays.default
          ];
        };

        luarc = pkgs.mk-luarc {
          nvim = pkgs.neovim-nightly;
          neodev-types = "nightly";
          plugins = with pkgs.lua51Packages;
            [
              rocks-nvim
            ]
            ++ (with pkgs.vimPlugins; [
              nvim-treesitter
            ]);
        };

        type-check-nightly = pre-commit-hooks.lib.${system}.run {
          src = self;
          hooks = {
            lua-ls.enable = true;
          };
          settings = {
            lua-ls.config = luarc;
          };
        };

        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = self;
          hooks = {
            alejandra.enable = true;
            stylua.enable = true;
            luacheck.enable = true;
            editorconfig-checker.enable = true;
          };
        };

        devShell = pkgs.mkShell {
          name = "rocks-treesitter.nvim devShell";
          shellHook = ''
            ${pre-commit-check.shellHook}
            ln -fs ${pkgs.luarc-to-json luarc} .luarc.json
          '';
          buildInputs = with pre-commit-hooks.packages.${system}; [
            alejandra
            lua-language-server
            stylua
            luacheck
            editorconfig-checker
          ];
        };
      in {
        devShells = {
          default = devShell;
          inherit devShell;
        };

        checks = {
          inherit
            pre-commit-check
            type-check-nightly
            ;
        };
      };
    };
}
