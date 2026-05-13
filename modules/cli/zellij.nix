{
  flake.modules.homeManager.zellij =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs = {
        zellij = {
          enable = true;
          enableZshIntegration = true;
          attachExistingSession = true;
          settings = {
            show_startup_tips = false;
            theme = "vague";
            themes = {
              vague = {
                text_unselected = {
                  base = "#cdcdcd";
                  background = "#141415";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#6e94b2";
                  emphasis_3 = "#bb9dbd";
                };
                text_selected = {
                  base = "#cdcdcd";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#6e94b2";
                  emphasis_3 = "#bb9dbd";
                };
                ribbon_unselected = {
                  base = "#252530";
                  background = "#cdcdcd";
                  emphasis_0 = "#252530";
                  emphasis_1 = "#cdcdcd";
                  emphasis_2 = "#f3be7c";
                  emphasis_3 = "#bb9dbd";
                };
                ribbon_selected = {
                  base = "#252530";
                  background = "#6e94b2";
                  emphasis_0 = "#252530";
                  emphasis_1 = "#f3be7c";
                  emphasis_2 = "#bb9dbd";
                  emphasis_3 = "#f3be7c";
                };
                table_title = {
                  base = "#7fa563";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#6e94b2";
                  emphasis_3 = "#bb9dbd";
                };
                table_cell_unselected = {
                  base = "#cdcdcd";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#6e94b2";
                  emphasis_3 = "#bb9dbd";
                };
                table_cell_selected = {
                  base = "#cdcdcd";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#6e94b2";
                  emphasis_3 = "#bb9dbd";
                };
                list_unselected = {
                  base = "#cdcdcd";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#6e94b2";
                  emphasis_3 = "#bb9dbd";
                };
                list_selected = {
                  base = "#cdcdcd";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#6e94b2";
                  emphasis_3 = "#bb9dbd";
                };
                frame_selected = {
                  base = "#aeaed1";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#aeaed1";
                  emphasis_2 = "#bb9dbd";
                  emphasis_3 = "#252530";
                };
                frame_unselected = {
                  base = "#606079";
                  background = "#606079";
                  emphasis_0 = "#606079";
                  emphasis_1 = "#606079";
                  emphasis_2 = "#606079";
                  emphasis_3 = "#606079";
                };
                frame_highlight = {
                  base = "#f3be7c";
                  background = "#252530";
                  emphasis_0 = "#bb9dbd";
                  emphasis_1 = "#f3be7c";
                  emphasis_2 = "#f3be7c";
                  emphasis_3 = "#f3be7c";
                };
                exit_code_success = {
                  base = "#7fa563";
                  background = "#252530";
                  emphasis_0 = "#aeaed1";
                  emphasis_1 = "#252530";
                  emphasis_2 = "#bb9dbd";
                  emphasis_3 = "#f3be7c";
                };
                exit_code_error = {
                  base = "#d8647e";
                  background = "#252530";
                  emphasis_0 = "#f3be7c";
                  emphasis_1 = "#252530";
                  emphasis_2 = "#252530";
                  emphasis_3 = "#252530";
                };
                multiplayer_user_colors = {
                  player_1 = "#bb9dbd";
                  player_2 = "#f3be7c";
                  player_3 = "#aeaed1";
                  player_4 = "#6e94b2";
                  player_5 = "#d8647e";
                  player_6 = "#7fa563";
                  player_7 = "#cdcdcd";
                  player_8 = "#606079";
                  player_9 = "#252530";
                  player_10 = "#141415";
                };
              };
            };
          };
        };
      };
    };
}
