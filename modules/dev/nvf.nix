{ inputs, ... }:
{
  flake.modules.homeManager.nvf =
    { pkgs, ... }:
    {
      home.packages = [
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [ ../../nvf/nvf-config.nix ];
        }).neovim
      ];
    };
}
