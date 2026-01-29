{
  pkgs,
  inputs,
  ...
}:
# let
#   pkgs-zed = import inputs.nixpkgs-zed {
#     system = pkgs.stdenv.hostPlatform.system;
#     config.allowUnfree = true;
#   };
# in
{
  home.packages = [
    # pkgs-zed.zed-editor
    pkgs.zed-editor
    pkgs.nil
    pkgs.nixd
  ];
}
