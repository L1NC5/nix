{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      draw_minimal_borders = "yes";
      window_margin_width = 6;
      hide_window_decoration = "yes";

      cursor_shape = "block";
      cursor_blink_interval = "-1 linear ease-out";
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
    };
    themeFile = "vague";
  };
}
