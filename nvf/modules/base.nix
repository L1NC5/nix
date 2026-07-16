{ pkgs, ... }: {
  config.vim = {
    options = {
      autoindent = true;
      foldlevel = 99;
      shiftwidth = 2;
      tabstop = 2;
    };
    searchCase = "smart";
    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    extraPackages = with pkgs; [
      fzf
      ripgrep
      wl-clipboard
      xclip
    ];
    filetree = {
      neo-tree.enable = true;
    };
    utility = {
      motion.flash-nvim.enable = true;
      yazi-nvim.enable = true;
    };
    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        action = ":Neotree toggle<CR>";
        desc = "Toggle Neo-tree (explorer)";
        silent = true;
      }
      {
        key = "<leader>E";
        mode = "n";
        action = ":Neotree reveal<CR>";
        desc = "Reveal file in Neo-tree";
        silent = true;
      }
    ];
  };
}
