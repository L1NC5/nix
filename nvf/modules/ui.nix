{
  config.vim = {
    ui = {
      borders.plugins.lspsaga.enable = true;
      colorizer.enable = false;
      illuminate.enable = true;
      nvim-highlight-colors = {
        enable = true;
        setupOpts = {
          render = "background";
          enable_tailwind = true;
        };
      };
      nvim-ufo.enable = true;
    };

    visuals = {
      blink-indent.enable = true;
      fidget-nvim.enable = true;
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
    };
  };
}
