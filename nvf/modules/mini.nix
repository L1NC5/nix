{
  config.vim = {
    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>lua MiniFiles.open()<cr>";
        desc = "Open file explorer";
      }
    ];
    mini = {
      ai.enable = true;
      basics = {
        enable = true;
        setupOpts = {
          options = {
            basic = true;
            extra_ui = true;
          };
          mappings.windows = true;
        };
      };
      icons.enable = true;
      move.enable = true;
      pairs.enable = true;
      statusline.enable = true;
    };
  };
}
