{
  inputs,
  lib,
  ...
}:
{
  flake.modules = {
    homeManager.home-base = {

    };
    nixos.home-base = {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = lib.mkDefault true;
        useUserPackages = lib.mkDefault true;
        extraSpecialArgs = { inherit inputs; };
        backupFileExtension = ".bak";
      };
    };
  };
}
