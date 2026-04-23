{
  inputs,
  self,
  ...
}:
{
  flake.homeConfigurations.deda = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    extraSpecialArgs = { inherit inputs self; };
    modules = with self.modules.homeManager; [
      deda
    ];
  };
}
