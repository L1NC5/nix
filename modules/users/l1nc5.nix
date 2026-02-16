{ inputs, ... }:
{
  flake.modules.nixos.l1nc5 = {
    imports = [
      inputs.self.modules.nixos.homeManager
    ];

    home-manager.users.l1nc5 = {
      imports = [
        inputs.self.modules.homeManager.l1nc5
      ];
    };

    users.users.l1nc5 = {
      isNormalUser = true;
      description = "l1nc5";
      extraGroups = [
        "networkmanager"
        "sabnzbd"
        "wheel"
      ];
    };
  };

  flake.modules.homeManager.l1nc5 = {
    imports = [
      "${inputs.self}/home/profiles/l1nc5/home.nix"
    ];
  };
}
