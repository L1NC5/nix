{ inputs, ... }:
{
  flake.modules.homeManager.scribe =
    { pkgs, ... }:
    {
      home.packages = [
        inputs.scribe.packages.${pkgs.system}.default
      ];
    };
}
