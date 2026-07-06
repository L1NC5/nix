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
  };
}
