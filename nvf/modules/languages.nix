{ ... }:
{
  config.vim = {
    diagnostics.enable = true;
    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
      bash.enable = true;
      css.enable = true;
      json.enable = true;
      nix.enable = true;
      html = {
        enable = true;
        treesitter.autotagHtml = true;
      };
      scss.enable = true;
      tsx = {
        enable = true;
      };
      typescript = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
    };
    autocomplete = {
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        setupOpts = {
          completion = {
            ghost_text.enabled = true;
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 200;
            };
          };
        };
        mappings = {
          next = "<C-N>";
          previous = "<C-P>";
          confirm = "<CR>";
          close = "<C-e>";
        };
      };
    };
    autopairs.nvim-autopairs.enable = true;
    lsp = {
      enable = true;
      otter-nvim.enable = true;
      presets = {
        bash-language-server.enable = true;
        nixd.enable = true;
        tailwindcss-language-server.enable = true;
      };
      servers = {
        bash-language-server = {
          filetypes = [
            "bash"
            "sh"
          ];
        };

        nixd = {
          filetypes = [ "nix" ];
          settings = {
            options = {
              nixos.expr = "((builtins.getFlake \"github:nixos/nixpkgs/nixos-unstable\").lib.nixosSystem { system = \"x86_64-linux\"; modules = []; }).options";
              home-manager.expr = "((builtins.getFlake \"github:nix-community/home-manager\").lib.homeManagerConfiguration { pkgs = import (builtins.getFlake \"github:nixos/nixpkgs/nixos-unstable\") {}; modules = []; }).options";
              nvf.expr = "((builtins.getFlake \"github:NotAShelf/nvf\").lib.neovimConfiguration { pkgs = import (builtins.getFlake \"github:nixos/nixpkgs/nixos-unstable\") {}; modules = []; }).options";
            };
          };
        };
      };
    };
    formatter.conform-nvim = {
      enable = true;
    };
  };
}
