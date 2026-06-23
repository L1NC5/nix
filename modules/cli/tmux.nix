{
  flake.modules.homeManager.tmux =
    {
      pkgs,
      ...
    }:
    let
      popupBind = key: w: h: cmd: ''
        bind ${key} display-popup -d "#{pane_current_path}" -w ${w} -h ${h} -E "${cmd}"
      '';
    in
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
            ${popupBind "C-y" "80%" "80%" "${pkgs.lazygit}/bin/lazygit"}
            ${popupBind "C-g" "80%" "80%" "${pkgs.lazydocker}/bin/lazydocker"}
            ${popupBind "C-f" "90%" "90%" "${pkgs.superfile}/bin/superfile"}
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
