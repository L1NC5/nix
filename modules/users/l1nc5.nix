{ inputs, ... }:
{
  flake.modules.nixos.l1nc5 =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        keyd
        telegram-desktop

        # Desktop
        sddm
      ];

      home-manager.users.l1nc5 = {
        imports = with inputs.self.modules.homeManager; [
          l1nc5

          # Desktop
          bibata
          niri
          noctalia
        ];
      };

      users.users.l1nc5 = {
        isNormalUser = true;
        description = "l1nc5";
        shell = pkgs.zsh;
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

      programs.zsh.enable = true;
    };

  flake.modules.homeManager.l1nc5 =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        # Dev
        lazygit
        zed

        # Browsers
        chromium
        zen-browser

        # Media
        mpv

        # Shell
        fastfetch
        kitty
        starship
        zsh

        # Themes
        recursive
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
