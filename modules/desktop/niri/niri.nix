{
  flake.modules.homeManager.niri =
    { config, ... }:
    let
      configPath = "${config.home.homeDirectory}/nix/modules/desktop/niri";
    in
    {
      xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink configPath;
    };
}
