{ ... }:
{
  imports = [
    ./modules/base.nix
    ./modules/fzf-lua.nix
    ./modules/languages.nix
    ./modules/mini.nix
  ];

  config.vim = {
    binds.whichKey.enable = true;
    comments.comment-nvim.enable = true;
    # keymaps = [
    #   {
    #     key = "<leader>e";
    #     mode = "n";
    #     silent = true;
    #     action = "<cmd>lua MiniFiles.open()<cr>";
    #     desc = "Open file explorer";
    #   }
    # ];
  };
}
