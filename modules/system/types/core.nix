{ inputs, ... }:
{
  flake.modules.nixos.system-core =
    { ... }:
    {
      imports = [
        inputs.self.modules.nixos.nix-settings

        # Services
        inputs.self.modules.nixos.keyd
      ];
    };
}
