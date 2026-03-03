{
  flake.modules.homeManager.zellij =
    { ... }:
    {
      programs.zellij = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          show_startup_tips = false;
          theme = "nightfox";
        };
      };
    };
}
