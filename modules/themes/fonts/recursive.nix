{
  flake.modules.homeManager.recursive =
    { pkgs, ... }:
    {
      # TODO: Add nerd-fonts option
      home.packages = [
        pkgs.recursive
        pkgs.nerd-fonts.symbols-only
      ];
    };
}
