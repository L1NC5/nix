{ inputs, ... }:
{
  flake.modules.homeManager.deda =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        lazygit
        fastfetch
        starship
        zellij
        zsh
      ];

      home = {
        username = "deda";
        homeDirectory = "/home/deda";
        packages = with pkgs; [
          home-manager
          ripgrep
          jq
          eza
          fzf
        ];
        stateVersion = "26.05";

        programs = {
          git = {
            enable = true;
            settings = {
              user = {
                name = "Federico Barbieri";
                email = "federico.barbieri@dedagroup.it";
              };
            };
          };
          zsh = {
            profileExtra = ''
              if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh"]; then
                . "$HOME/.nix-profile/etc/profile.d/nix.sh"
              fi
            '';
          };
        };
      };
    };
}
