{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.alchemist = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      # Global modules
      self.modules.nixos.system-laptop

      # Host specific modules
      self.modules.nixos.hardware-alchemist
      self.modules.nixos.host-alchemist
      self.modules.nixos.alchemist-led
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen2

      # Home Manager
      self.modules.nixos.homeManager
      self.modules.nixos.l1nc5
    ];
  };

  flake.modules.nixos.host-alchemist =
    { ... }:
    {
      networking.hostName = "alchemist";
      networking.networkmanager.enable = true;
      time.timeZone = "Europe/Rome";
      i18n.defaultLocale = "it_IT.UTF-8";

      nixpkgs.config.allowUnfree = true;

      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      services = {
        sabnzbd = {
          enable = true;
          openFirewall = true;
          user = "l1nc5";
          group = "users";
        };
      };

      programs = {
        niri.enable = true;
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
