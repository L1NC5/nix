{
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos.homeManager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
