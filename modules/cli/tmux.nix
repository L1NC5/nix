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
      programs.tmux = {
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

          set -g status-position top

          # ── Vague theme ───────────────────────────────────────── #
          set -g status on
          set -g status-interval 1
          set -g status-left-length 100
          set -g status-right-length 100
          set -g status-style "fg=#cdcdcd,bg=#1c1c24"
          set -g status-justify absolute-centre

          set -g message-style "fg=#252530,bg=#aeaed1"

          set -g status-left "#[fg=#252530,bg=#aeaed1]  #H #[fg=#cdcdcd,bg=#252530]  #S "
          set -g status-right " #[fg=#cdcdcd,bg=#252530] 󰃭 %A %d %b #[fg=#252530,bg=#aeaed1] 󰥔 %I:%M:%S %p "

          setw -g window-status-separator " "
          setw -g window-status-format "#[fg=#252530,bg=#d7d7d7] #I #[fg=#cdcdcd,bg=#252530] #W "
          setw -g window-status-current-format "#[fg=#252530,bg=#f3be7c] #I #[fg=#cdcdcd,bg=#252530] #W "
          # ──────────────────────────────────────────────────────── #

          bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
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
              set -g @continuum-save-interval '60'
            '';
          }
        ];
      };
    };

}
