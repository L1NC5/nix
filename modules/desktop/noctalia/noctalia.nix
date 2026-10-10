{ noctaliaModule, ... }:
{
  flake.modules.homeManager.noctalia =
    { config, ... }:
    let
      configPath = "${config.home.homeDirectory}/nix/modules/desktop/noctalia";
    in
    {
      imports = [
        noctaliaModule
      ];

      programs.noctalia = {
        enable = true;
      };

      home.file = {
        ".config/noctalia".source = config.lib.file.mkOutOfStoreSymlink configPath;
      };
    };
}
