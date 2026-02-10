{
  flake.modules.nixos.wayland-de =
    { ... }:
    {
      services.xserver.enable = false;
      services.displayManager = {
        sddm = {
          wayland.enable = true;
          enable = true;
          settings = {
            Wayland = {
              EnableHiDPI = true;
            };
          };
        };
      };
    };
}
