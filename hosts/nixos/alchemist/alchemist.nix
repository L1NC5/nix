{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.alchemist = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs self;};
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
    ];
  };

  flake.modules.nixos.host-alchemist = {pkgs, ...}: {
    networking.hostName = "alchemist";
    networking.networkmanager.enable = true;
    time.timeZone = "Europe/Rome";
    i18n.defaultLocale = "en_US.UTF-8";
    nixpkgs.config.allowUnfree = true;
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    environment.systemPackages = with pkgs; [
      (pkgs.writeShellScriptBin "xmage" ''
        export _JAVA_AWT_WM_NONREPARENTING=1
        exec ${pkgs.xmage}/bin/xmage "$@"
      '')
    ];
    services.sabnzbd = {
      enable = true;
      openFirewall = true;
      user = "l1nc5";
      group = "users";
    };
    nix.settings = {
      trusted-users = ["root" "l1nc5"];
    };
    system.stateVersion = "25.11";
  };
}
