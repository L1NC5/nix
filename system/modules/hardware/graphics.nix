{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libva
      libva-vdpau-driver
      libvdpau-va-gl
      libGL
      mesa
    ];
    extraPackages32 = with pkgs; [
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
}
