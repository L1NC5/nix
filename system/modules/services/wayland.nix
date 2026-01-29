{...}: {
  # Enable wayland and session manager
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
}
