
{ ... }:
{
  config.vim = {
    diagnostics.enable = true;
    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
      css.enable = true;
      nix.enable = true;
      html.enable = true;
      scss.enable = true;
      typescript = {
        enable = true;
        extensions.ts-error-translator.enable = true;
      };
    };
    autocomplete = {
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = false;
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
      otter-nvim.enable = true;
      presets = {
        bash-language-server.enable = true;
        nixd.enable = true;
        tailwindcss-language-server.enable = true;
        typescript-language-server.enable = true;
        vscode-css-language-server.enable = true;
        vscode-json-language-server.enable = true;
      };
      servers = {
        bash-language-server = {
          filetypes = ["bash" "sh"];
        };
        nixd = {
          filetypes = ["nix"];
          settings = {
            options = {
              home-manager = {
                expr = "(builtins.getFlake \"/home/deda/nix\").nixosConfigurations.alchemist.options.home-manager.users.type.nestedTypes.elemType.getSubOptions []";
              };
              nvf = {
                expr = "((builtins.getFlake \"github:NotAShelf/nvf\").lib.neovimConfiguration { pkgs = import (builtins.getFlake \"github:nixos/nixpkgs/nixos-unstable\") {}; modules = []; }).options";
              };
            };
          };
        };
        vscode-css-language-server = {
          filetypes = ["css" "scss" "less"];
        };
        vscode-json-language-server = {
          filetypes = ["json" "jsonc"];
        };
      };
    };
  };
}
