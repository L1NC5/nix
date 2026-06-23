{ inputs, ... }:
{
  flake.modules.nixos.system-laptop =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        system-core

        # Hardware
        bluetooth
        graphics
        laptop-lid
        power-management

        # Services
        plymouth
        gnome-keyring
        pipewire
        sddm

        # Desktop
        niri
      ];
      # Print
      services.printing = {
        enable = true;
        drivers = [
          pkgs.hplipWithPlugin
        ];
      };
    };
}
