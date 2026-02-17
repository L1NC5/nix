{ inputs, ... }:
{
  flake.modules.nixos.system-laptop =
    { ... }:
    {
      imports = [
        inputs.self.modules.nixos.system-core

        # Hardware
        inputs.self.modules.nixos.bluetooth
        inputs.self.modules.nixos.graphics
        inputs.self.modules.nixos.laptop-lid
        inputs.self.modules.nixos.power-management

        # Services
        inputs.self.modules.nixos.gnome-keyring
        inputs.self.modules.nixos.pipewire
        inputs.self.modules.nixos.wayland-de
      ];
      services.printing.enable = true;
    };
}
