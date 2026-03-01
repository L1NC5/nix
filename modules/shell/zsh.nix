{
  flake.modules.homeManager.zsh =
    { ... }:
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "command-not-found"
            "history"
            "git"
            "nvm"
            "node"
            "npm"
          ];
        };
      };
    };
}
