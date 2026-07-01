{ ... }:
{
  config = {
    vim = {
      fzf-lua = {
        enable = true;
        profile = "default";
      };
      binds.whichKey.register = {
        "<leader>f" = "+Fzf/Search";
      };
      keymaps = [
        # Files
        {
          key = "<leader>ff";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua files<cr>";
          desc = "Find Files";
        }
        {
          key = "<leader>fr";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua oldfiles<cr>";
          desc = "Recent files";
        }
        # Search
        {
          key = "<leader>fg";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua live_grep<cr>";
          desc = "Live grep";
        }
        {
          key = "<leader>fw";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua grep_visual<cr>";
          desc = "Grep word under cursor";
        }
        {
          key = "<leader>fw";
          mode = "v";
          silent = true;
          action = "<cmd>FzfLua grep_visual<cr>";
          desc = "Grep selection";
        }
        {
          key = "<leader>fR";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua grep_visual<cr>";
          desc = "Resume last search";
        }
        {
          key = "<leader>ft";
          mode = "n";
          silent = true;
          action = "<cmd>TodoQuickFix<cr><cmd>FzfLua quickfix<cr>";
          desc = "Todo comments (quickfix)";
        }
        # Buffers
        {
          key = "<leader>fb";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua buffers<cr>";
          desc = "List buffers";
        }
        # LSP
        {
          key = "<leader>ld";
          mode = "n";
          action = "<cmd>FzfLua lsp_definitions<cr>";
          desc = "Definitions";
        }
        {
          key = "<leader>lr";
          mode = "n";
          action = "<cmd>FzfLua lsp_references<cr>";
          desc = "References";
        }
        {
          key = "<leader>li";
          mode = "n";
          action = "<cmd>FzfLua lsp_implementations<cr>";
          desc = "Implementations";
        }
        {
          key = "<leader>lt";
          mode = "n";
          action = "<cmd>FzfLua lsp_typedefs<cr>";
          desc = "Type definitions";
        }
        {
          key = "<leader>ls";
          mode = "n";
          action = "<cmd>FzfLua lsp_document_symbols<cr>";
          desc = "Document symbols";
        }
        {
          key = "<leader>lS";
          mode = "n";
          action = "<cmd>FzfLua lsp_workspace_symbols<cr>";
          desc = "Workspace symbols";
        }
        {
          key = "<leader>la";
          mode = "n";
          action = "<cmd>FzfLua lsp_code_actions<cr>";
          desc = "Code actions";
        }
        # Diagnostics
        {
          key = "<leader>xd";
          mode = "n";
          action = "<cmd>FzfLua diagnostics_document<cr>";
          desc = "Document diagnostics";
        }
        {
          key = "<leader>xw";
          mode = "n";
          action = "<cmd>FzfLua diagnostics_workspace<cr>";
          desc = "Workspace diagnostics";
        }
      ];
    };
  };
}
