{
  self,
  rocks-nvim-flake,
}: final: prev: let
  name = "rocks-treesitter.nvim";

  luaPackage-override = luaself: luaprev: {
    rocks-nvim = rocks-nvim-flake.packages.${final.system}.rocks-nvim;
    rocks-treesitter-nvim = luaself.callPackage ({
      luaOlder,
      buildLuarocksPackage,
      lua,
      rocks-nvim,
    }:
      buildLuarocksPackage {
        pname = name;
        version = "scm-1";
        knownRockspec = "${self}/rocks-treesitter.nvim-scm-1.rockspec";
        src = self;
        disabled = luaOlder "5.1";
        propagatedBuildInputs = [
          rocks-nvim
        ];
      }) {};
  };
  lua5_1 = prev.lua5_1.override {
    packageOverrides = luaPackage-override;
  };
  lua51Packages = prev.lua51Packages // final.lua5_1.pkgs;
  luajit = prev.luajit.override {
    packageOverrides = luaPackage-override;
  };
  luajitPackages = prev.luajitPackages // final.luajit.pkgs;

  neovim-with-rocks = let
    rocks = rocks-nvim-flake.packages.${final.system}.rocks-nvim;
    rocks-ts = final.luajitPackages.rocks-treesitter-nvim;
    neovimConfig = final.neovimUtils.makeNeovimConfig {
      withPython3 = true;
      viAlias = false;
      vimAlias = false;
      # plugins = [ final.vimPlugins.rocks-nvim ];
      extraLuaPackages = ps: [ps.rocks-nvim];
    };
  in
    final.wrapNeovimUnstable final.neovim-nightly (neovimConfig
      // {
        luaRcContent =
          /*
          lua
          */
          ''
            -- Copied from installer.lua
            local rocks_config = {
                rocks_path = vim.fn.stdpath("data") .. "/rocks",
                luarocks_binary = "${final.lua51Packages.luarocks}/bin/luarocks",
            }

            vim.g.rocks_nvim = rocks_config

            local luarocks_path = {
                vim.fs.joinpath("${rocks}", "share", "lua", "5.1", "?.lua"),
                vim.fs.joinpath("${rocks}", "share", "lua", "5.1", "?", "init.lua"),
                vim.fs.joinpath("${rocks-ts}", "share", "lua", "5.1", "?.lua"),
                vim.fs.joinpath("${rocks-ts}", "share", "lua", "5.1", "?", "init.lua"),
                vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
                vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
            }
            package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

            local luarocks_cpath = {
                vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
                vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
            }
            package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

            vim.opt.runtimepath:append(vim.fs.joinpath("${rocks}", "rocks.nvim-scm-1-rocks", "rocks.nvim", "*"))
            vim.opt.runtimepath:append(vim.fs.joinpath("${rocks-ts}", "rocks-treesitter.nvim-scm-1-rocks", "rocks-treesitter.nvim", "*"))
          '';
        wrapRc = true;
        wrapperArgs =
          final.lib.escapeShellArgs neovimConfig.wrapperArgs
          + " "
          + ''--set NVIM_APPNAME "nvimrocks"'';
      });
in {
  inherit
    lua5_1
    lua51Packages
    luajit
    luajitPackages
    neovim-with-rocks
    ;

  vimPlugins =
    prev.vimPlugins
    // {
      rocks-treesitter-nvim = final.neovimUtils.buildNeovimPlugin {
        pname = name;
        version = "dev";
        src = self;
      };
    };

  rocks-treesitter-nvim = lua51Packages.rocks-treesitter-nvim;
}
