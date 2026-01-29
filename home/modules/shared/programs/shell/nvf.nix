{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      vimAlias = true;

      lazy.plugins = {
        "kulala.nvim" = {
          package = pkgs.vimPlugins.kulala-nvim;

          setupModule = "kulala";

          setupOpts = {
            global_keymaps = true;
            global_keymaps_prefix = "<leader>R";
          };
        };
      };

      autocomplete = {
        nvim-cmp.enable = true;
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      keymaps = [
        {
          key = "<leader>e";
          mode = "n";
          silent = true;
          action = ":lua MiniFiles.open()<CR>";
          desc = "Open mini.files";
        }
      ];

      lsp = {
        enable = true;

        formatOnSave = true;
        lightbulb.enable = true;
        trouble.enable = true;
        otter-nvim.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        bash.enable = true;
        css.enable = true;
        tailwind.enable = true;
        html.enable = true;
        json.enable = true;
        ts.enable = true;
        lua.enable = true;
      };

      mini = {
        ai.enable = true;
        basics.enable = true;
        comment.enable = true;
        files.enable = true;
        indentscope.enable = true;
        surround.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
      };

      options = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 2;
        autoindent = true;
      };

      treesitter = {
        enable = true;
        indent.enable = true;
        autotagHtml = true;
        context.enable = true;
        fold = true;
      };

      statusline = {
        lualine = {
          enable = true;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
      };

      utility = {
        ccc.enable = true;
      };

      visuals = {
        # fidget-nvim.enable = true;
        nvim-cursorline.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;

        cinnamon-nvim = {
          enable = true;
          setupOpts.keymaps.basic = true;
        };
      };
    };
  };
}
