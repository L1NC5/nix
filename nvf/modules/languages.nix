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
      nix = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "nixd" ];
        };
      };
      html = {
        enable = true;
        treesitter.autotagHtml = true;
      };
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
              treesitter_highlighting = true;
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
          init_options = {
            nixos.expr = "(builtins.getFlake \"/nix/store/mcjj0vjbpsmk3z6yqrzhqign3l1rb24w-w17vgjj0szm25p4g71srsip220rvyplg-source\").nixosConfigurations.alchemist.options";
            home-manager.expr = "(builtins.getFlake \"flake:.\").nixosConfigurations.alchemist.options.home-manager.users.type.nestedTypes.elemType.getSubOptions [ ]";
          };
        };
      };
    };
    formatter.conform-nvim = {
      enable = true;
    };
  };
}
