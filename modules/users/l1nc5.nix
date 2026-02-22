{ inputs, ... }:
{
  flake.modules.nixos.l1nc5 = {
    imports = with inputs.self.modules.nixos; [
      telegram-desktop
      keyd
    ];

    home-manager.users.l1nc5 = {
      imports = with inputs.self.modules.homeManager; [
        l1nc5
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

    services.keyd.keyboards.default.settings = {
      main = {
        capslock = "overload(control,esc)";
        esc = "capslock";
      };
    };
  };

  flake.modules.homeManager.l1nc5 = {
    imports = [
      "${inputs.self}/home/profiles/l1nc5/home.nix"
    ];

    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            name = "L1NC5";
            email = "barbieri.federico96@gmail.com";
          };
        };
      };
    };
  };
}
