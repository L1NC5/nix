{ pkgs, ... }:
{
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
  ];
}
