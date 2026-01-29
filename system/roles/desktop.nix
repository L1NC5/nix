{pkgs, ...}: {
  imports = [
    ../modules/services/gnome.nix
    ../modules/services/pipewire.nix
    ../modules/services/wayland.nix
  ];

  services.printing.enable = true;
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    easyeffects
    mako
    hyprpolkitagent
    git
    quickshell

    # Shell
    btop
    wget
    tree
    fastfetch
    # Keymapper
    keyd
  ];
}
