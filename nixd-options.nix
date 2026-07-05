let
  flake = builtins.getFlake (toString ./.);
in {
  nixos = flake.nixosConfigurations.alchemist.options;
  home-manager = flake.nixosConfigurations.alchemist.options.home-manager.users.type.nestedTypes.elemType.getSubOptions [];
  nvf =
    (flake.inputs.nvf.lib.neovimConfiguration {
      pkgs = flake.inputs.nixpkgs.legacyPackages.x86_64-linux;
      modules = [];
    }).options;
}
