{ ... }:
{
  flake.modules.nixos.nix = {
    nix = {
      optimise.automatic = true;

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];

        # Automatically detect files in the store that have identical contents, and replaces
        # them with hard links to a single copy. This saves disk space.
        auto-optimise-store = true;

        # The maximum number of parallel TCP connections used to fetch files from binary caches and by other downloads.
        # It defaults to 25. 0 means no limit.
        http-connections = 128;
        #
        # This option defines the maximum number of substitution jobs that Nix will try to run in
        # parallel. The default is 16. The minimum value one can choose is 1 and lower values will be
        # interpreted as 1.
        max-substitution-jobs = 128;
      };
    };
  };
}
