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
          keyMode = "emacs";
          mouse = true;
          prefix = "C-a";
          shell = "${pkgs.zsh}/bin/zsh";
          clock24 = true;
          disableConfirmationPrompt = true;
          sensibleOnTop = true;
          baseIndex = 1;
          focusEvents = true;
          extraConfig = ''
            bind C-y display-popup \
            -d "#{pane_current_path}" \
            -w 80% \
            -h 80% \
            -E "${pkgs.lazygit}/bin/lazygit"

            bind C-f display-popup \
            -d "#{pane_current_path}" \
            -w 90% \
            -h 90% \
            -E "${pkgs.superfile}/bin/superfile"
          '';
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
