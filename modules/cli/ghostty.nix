{
  flake.modules.homeManager.ghostty =
    { ... }:
    {
      programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        installVimSyntax = true;
        settings = {
          background-opacity = "0.9";
          background-blur = true;
          font-family = "Rec Mono Semicasual";
          theme = "Vague";
        };
      };
    };
}
