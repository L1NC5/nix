{ lib, ... }:
let
  nixBaseConfig = {
    optimise.automatic = lib.mkDefault true;

    settings = {
      experimental-features = lib.mkDefault [
        "nix-command"
        "flakes"
      ];

      # Automatically detect files in the store that have identical contents, and replaces
      # them with hard links to a single copy. This saves disk space.
      auto-optimise-store = lib.mkDefault true;

      # The maximum number of parallel TCP connections used to fetch files from binary caches and by other downloads.
      # It defaults to 25. 0 means no limit.
      http-connections = lib.mkDefault 64;
      #
      # This option defines the maximum number of substitution jobs that Nix will try to run in
      # parallel. The default is 16. The minimum value one can choose is 1 and lower values will be
      # interpreted as 1.
      max-substitution-jobs = lib.mkDefault 64;

      substituters = lib.mkDefault [
        # high priority since it's almost always used
        "https://cache.nixos.org?priority=10"
        "https://install.determinate.systems"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = lib.mkDefault [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM"
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
in
{
  flake.modules = {
    nixos.nix-settings = {
      nix = nixBaseConfig;
    };

    darwin.nix-settings = {
      nix = nixBaseConfig;
    };

    homeManager.nix-settings = {
      nix = nixBaseConfig;
    };
  };
}
