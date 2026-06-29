{
  flake.modules.homeManager.nvf =
    { inputs, pkgs, ... }:
    {
      home.packages = [
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            vague-nvim-src = inputs.vague-nvim;
          };
          modules = [ ../../nvf/nvf-config.nix ];
        }).neovim
      ];
    };
}
