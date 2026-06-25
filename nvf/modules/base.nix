{ pkgs, ... }:
{
  config.vim = {
    options = {
      autoindent = true;
      shiftwidth = 2;
      tabstop = 2;

    };
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
