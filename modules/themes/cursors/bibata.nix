{
  flake.modules.homeManager.bibata =
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
    };
}
