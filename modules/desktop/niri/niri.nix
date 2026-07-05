{
  flake.modules = {
    nixos.niri = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        niri
        xwayland-satellite
      ];
      programs.niri.enable = true;
    };
    homeManager.niri =
      { config, ... }:
      let
        configPath = "${config.home.homeDirectory}/nix/modules/desktop/niri";
      in
      {
        xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink configPath;
      };
  };
}
