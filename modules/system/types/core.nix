{ inputs, ... }:
{
  flake.modules.nixos.system-core =
    { ... }:
    {
      imports = [
        inputs.self.modules.nixos.nix-settings
      ];
    };
}
