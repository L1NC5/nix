{ inputs, ... }:
{
  flake.modules.nixos.system-laptop =
    { ... }:
    {
      imports = [
        inputs.self.modules.nixos.bluetooth
        inputs.self.modules.nixos.graphics
      ];
    };
}
