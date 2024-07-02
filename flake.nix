{
  description = "A rocks.nvim module that helps you manage tree-sitter parsers";

  nixConfig = {
    extra-substituters = "https://neorocks.cachix.org";
    extra-trusted-public-keys = "neorocks.cachix.org-1:WqMESxmVTOJX7qoBC54TwrMMoVI1xAM+7yFin8NRfwk=";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    neorocks.url = "github:nvim-neorocks/neorocks";

    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";

    rocks-nvim-flake = {
      url = "github:nvim-neorocks/rocks.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    neorocks,
    gen-luarc,
    rocks-nvim-flake,
    flake-parts,
    git-hooks,
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
            rocks-nvim-flake.overlays.default
            self.overlays.default
            neorocks.overlays.default
            gen-luarc.overlays.default
          ];
        };

        luarc = pkgs.mk-luarc {
          nvim = pkgs.neovim-nightly;
          plugins = with pkgs.lua51Packages; [
            rocks-nvim
          ];
        };

        type-check-nightly = git-hooks.lib.${system}.run {
          src = self;
          hooks = {
            lua-ls = {
              enable = true;
              settings.configuration = luarc;
            };
          };
        };

        pre-commit-check = git-hooks.lib.${system}.run {
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
          buildInputs =
            self.checks.${system}.pre-commit-check.enabledPackages
            ++ (with pkgs; [
              (lua5_1.withPackages (ps: with ps; [luarocks dkjson]))
            ]);
        };
      in {
        packages = rec {
          default = rocks-treesitter-nvim;
          inherit (pkgs.luajitPackages) rocks-treesitter-nvim;
          inherit (pkgs) neovim-with-rocks;
        };

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
      flake = {
        overlays.default = import ./nix/overlay.nix {inherit self rocks-nvim-flake;};
      };
    };
}
