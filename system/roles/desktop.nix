{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    easyeffects
    mako
    hyprpolkitagent
    quickshell
  ];
}
