{ ... }:
{
  flake.modules.homeManager.zed =
    { pkgs, ... }:
    {
      programs.zed-editor = {
        enable = true;
        extraPackages = with pkgs; [
          nil
          nixd
          nixfmt
        ];
        mutableUserSettings = true;
      };
    };
}
