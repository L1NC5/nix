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
      basics.enable = true;
      files.enable = true;
      icons.enable = true;
      indentscope.enable = true;
      move.enable = true;
      # notify.enable = true;
      pairs.enable = true;
      statusline.enable = true;
      surround.enable = true;
      tabline.enable = true;
    };
  };
}
