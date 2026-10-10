{
  flake.modules.homeManager.eza =
    { ... }:
    {
      programs = {
        eza = {
          enable = true;
          icons = "always";
          theme = "rose-pine";
          extraOptions = [
            "--group-directories-first"
            "--header"
          ];
          enableZshIntegration = true;
        };
      };
    };
}
