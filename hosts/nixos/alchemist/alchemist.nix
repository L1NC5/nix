{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.alchemist = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.modules.nixos; [
      # Global modules
      system-laptop

      # Host specific modules
      hardware-alchemist
      host-alchemist
      alchemist-led
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen2

      # Home Manager
      home-base
      l1nc5

      # nvf
      inputs.nvf.nixosModules.default
      nvf
    ];
  };

  flake.modules.nixos.host-alchemist =
    { pkgs, ... }:
    {
      networking.hostName = "alchemist";
      networking.networkmanager.enable = true;
      time.timeZone = "Europe/Rome";
      i18n.defaultLocale = "en_US.UTF-8";

      nixpkgs.config.allowUnfree = true;

      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      environment.systemPackages = with pkgs; [ lmstudio ];

      services = {
        sabnzbd = {
          enable = true;
          openFirewall = true;
          user = "l1nc5";
          group = "users";
        };
      };

      # this value determines the nixos release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. it‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.11"; # did you read the comment?
    };
}
