{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    # Non serve ripetere cursorTheme qui, pointerCursor lo gestisce già
    gtk3.extraConfig = {
      gtk-cursor-theme-name = "Bibata-Modern-Classic";
    };
    gtk4.extraConfig = {
      gtk-cursor-theme-name = "Bibata-Modern-Classic";
    };
  };
}
