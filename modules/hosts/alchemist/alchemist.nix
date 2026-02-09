{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations.alchemist = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.host-alchemist
      self.modules.nixos.system-laptop
      self.modules.nixos.alchemist-led
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen2
    ];
  };

  flake.modules.nixos.host-alchemist =
    { ... }:
    let
      username = "l1nc5";
    in
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
        "${self}/system/hosts/alchemist/hardware-configuration.nix"
        "${self}/system/roles/desktop.nix"
      ];

      networking.hostName = "alchemist";
      networking.networkmanager.enable = true;
      time.timeZone = "Europe/Rome";
      i18n.defaultLocale = "it_IT.UTF-8";

      nixpkgs.config.allowUnfree = true;

      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      hardware.cpu.amd.updateMicrocode = true;

      services = {
        keyd = {
          enable = true;
          keyboards.default.settings = {
            main = {
              capslock = "overload(control,esc)";
              esc = "capslock";
            };
          };
        };

        sabnzbd = {
          enable = true;
          openFirewall = true;
          user = username;
          group = "users";
        };
      };

      users.users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = [
          "networkmanager"
          "sabnzbd"
          "wheel"
        ];
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.${username} = import "${inputs.self}/home/profiles/${username}/home.nix";
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
