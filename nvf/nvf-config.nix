{ inputs, pkgs, ... }:
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
    theme.enable = false;
    ui = {
      ui2.enable = true;
      colorizer.enable = true;
      # nvim-ufo.enable = true;
    };

    extraPlugins = {
      cole = {
        setup = ''
          vim.cmd.colorscheme("cole")
        '';
      };
    };
  };
}
