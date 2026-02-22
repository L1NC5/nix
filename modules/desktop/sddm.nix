{
  flake.modules.nixos.sddm =
    { lib, ... }:
    {
      services.xserver.enable = lib.mkDefault false;
      services.displayManager = {
        sddm = {
          wayland.enable = lib.mkDefault true;
          enable = lib.mkDefault true;
          settings = {
            Wayland = {
              EnableHiDPI = lib.mkDefault true;
            };
          };
        };
      };
    };
}
