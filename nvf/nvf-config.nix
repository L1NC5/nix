{ ... }:
{
  imports = [
    ./modules/base.nix
    ./modules/fzf-lua.nix
    ./modules/mini.nix
  ];

  config.vim = {
    binds.whichKey.enable = true;
    comments.comment-nvim.enable = true;
    diagnostics.enable = true;
    filetree.neo-tree.enable = true;
    # keymaps = [
    #   {
    #     key = "<leader>e";
    #     mode = "n";
    #     silent = true;
    #     action = "<cmd>lua MiniFiles.open()<cr>";
    #     desc = "Open file explorer";
    #   }
    # ];
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
      # otter-nvim.enable = true;
      presets = {
        bash-language-server = {
          enable = true;
        };
        tailwindcss-language-server.enable = true;
        typescript-language-server.enable = true;
        vscode-css-language-server.enable = true;
        vscode-json-language-server.enable = true;
      };
      lspconfig.sources = {
        bashls = ''
          lspconfig.bashls.setup {
            filetypes = { "sh", "bash" },
          }
        '';
      };
    };
  };
}
