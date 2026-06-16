{
  flake.modules.homeManager.tmux =
    {
      pkgs,
      ...
    }:
    {
      programs = {
        tmux = {
          enable = true;
          keyMode = "vi";
          mouse = true;
          prefix = "C-a";
          shell = "${pkgs.zsh}/bin/zsh";
          clock24 = true;
          disableConfirmationPrompt = true;
          plugins = with pkgs; [
            tmuxPlugins.cpu
            {
              plugin = tmuxPlugins.resurrect;
              extraConfig = "set -g @resurrect-strategy-nvim 'session'";
            }
            {
              plugin = tmuxPlugins.continuum;
              extraConfig = ''
                set -g @continuum-restore 'on'
                set -g @continuum-save-interval '60' # minutes
              '';
            }
          ];
        };
      };
    };
}
