{ pkgs, ... }:
let
  cursorName = "Bibata-Modern-Classic";
in
{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = cursorName;
    size = 24;
  };

  gtk = {
    enable = true;
    # Non serve ripetere cursorTheme qui, pointerCursor lo gestisce già
    gtk3.extraConfig = {
      gtk-cursor-theme-name = cursorName;
    };
    gtk4.extraConfig = {
      gtk-cursor-theme-name = cursorName;
    };
  };
}
