{ inputs, ... }:
{
  flake.modules.nixos.system-core =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        nix-settings
        keyd
      ];

      environment.systemPackages = with pkgs; [
        git
        wget
        btop
        tree
        fastfetch
      ];
    };
}
