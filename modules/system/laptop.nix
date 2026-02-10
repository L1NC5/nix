{ inputs, ... }:
{
  flake.modules.nixos.system-laptop =
    { ... }:
    {
      imports = [
        # Hardware modules
        inputs.self.modules.nixos.bluetooth
        inputs.self.modules.nixos.graphics
        inputs.self.modules.nixos.power-management
        inputs.self.modules.nixos.laptop-lid

        # Services
        inputs.self.modules.nixos.gnome-keyring
        inputs.self.modules.nixos.pipewire
        inputs.self.modules.nixos.wayland-de
      ];
    };
}
