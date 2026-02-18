{ inputs, ... }:
{
  flake.modules.nixos.system-laptop =
    { ... }:
    {
      imports = with inputs.self.modules.nixos; [
        system-core

        # Hardware
        bluetooth
        graphics
        laptop-lid
        power-management

        # Services
        gnome-keyring
        pipewire
        wayland-de
      ];
      services.printing.enable = true;
    };
}
