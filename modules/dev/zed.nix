{
  flake.modules.homeManager.zed =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.zed-editor
        pkgs.nil
        pkgs.nixd
      ];
    };
}
