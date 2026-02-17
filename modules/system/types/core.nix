{ inputs, ... }:
{
  flake.modules.nixos.system-core =
    { pkgs, ... }:
    {
      imports = [
        inputs.self.modules.nixos.nix-settings
        inputs.self.modules.nixos.keyd
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
