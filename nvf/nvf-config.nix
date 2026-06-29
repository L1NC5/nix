{
  inputs,
  vague-nvim-src,
  pkgs,
  ...
}:
let
  vague-plugin = pkgs.vimUtils.buildVimPlugin {
    name = "vague-nvim";
    src = vague-nvim-src;
  };
in
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
      vague-nvim = {
        package = vague-plugin;
        setup = ''
          require("vague").setup({})
          vim.cmd('colorscheme vague')
        '';
      };
    };
  };
}
