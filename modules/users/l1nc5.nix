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

  flake.modules.homeManager.l1nc5 =
    { pkgs, ... }:
    {
      imports = [
        # Dev
        inputs.self.modules.homeManager.lazygit
        inputs.self.modules.homeManager.zed

        # Browsers
        inputs.self.modules.homeManager.chromium
        inputs.self.modules.homeManager.zen-browser

        # Themes
        ## Font
        inputs.self.modules.homeManager.recursive

        "${inputs.self}/home/profiles/l1nc5/home.nix"
      ];

      home = {
        username = "l1nc5";
        homeDirectory = "/home/l1nc5";
        packages = with pkgs; [
          home-manager
          yazi
          ripgrep
          jq
          eza
          fzf
          mtr
        ];
        stateVersion = "25.11";
      };

      programs = {
        bash = {
          enable = true;
          enableCompletion = true;
        };
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
