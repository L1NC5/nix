{pkgs, ...}: {
  # Power managemenr
  powerManagement.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Force S3 sleep
  boot.kernelParams = [
    "mem_sleep_default=deep"
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
