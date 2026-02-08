{ inputs, ... }:
{
  flake.modules.nixos.system-laptop =
    { ... }:
    {
      imports = [
        inputs.self.modules.nixos.nix
        inputs.self.modules.nixos.bluetooth
      ];
    };
}
