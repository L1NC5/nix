{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.recursive
    pkgs.nerd-fonts.symbols-only
  ];
}
