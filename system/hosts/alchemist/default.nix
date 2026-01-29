{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/nix-settings.nix

    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/graphics.nix
    ../../modules/hardware/laptop.nix
    ../../modules/hardware/laptop-lid.nix

    ../../roles/desktop.nix
  ];

  networking.hostName = "alchemist";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "it_IT.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.cpu.amd.updateMicrocode = true;

  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "overload(control,esc)";
        esc = "capslock";
      };
    };
  };

  services.sabnzbd = {
    enable = true;
    openFirewall = true;
    user = "l1nc5";
    group = "users";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.l1nc5 = {
    isNormalUser = true;
    description = "l1nc5";
    extraGroups = [
      "networkmanager"
      "sabnzbd"
      "wheel"
    ];
  };

  programs = {
    niri.enable = true;
  };

  # System specific:
  # Configure audio interface's LEDs when loading is complete
  services.udev.extraRules = ''
    SUBSYSTEM=="sound", ACTION=="add", KERNEL=="controlC*", RUN+="${pkgs.bash}/bin/bash -c 'sleep 1; echo follow-route > /sys/class/sound/ctl-led/mic/mode; echo off > /sys/class/sound/ctl-led/speaker/mode'"
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
