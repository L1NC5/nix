{
  flake.modules.homeManager.zellij =
    { ... }:
    {
      programs.zellij = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          theme = "nightfox";
        };
      };
    };
}
