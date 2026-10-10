{
  vague-nvim-src,
  pkgs,
  ...
}: let
  vague-plugin = pkgs.vimUtils.buildVimPlugin {
    name = "vague-nvim";
    src = vague-nvim-src;
  };
in {
  imports = [
    ./modules/base.nix
    ./modules/fzf-lua.nix
    ./modules/languages.nix
    ./modules/mini.nix
    ./modules/ui.nix
  ];

  config.vim = {
    binds.whichKey.enable = true;
    comments.comment-nvim.enable = true;
    theme.enable = false;
    git.enable = true;

    notes = {
      todo-comments = {
        enable = true;
      };
    };

    dashboard = {
      alpha = {
        enable = true;
        theme = "dashboard";
      };
    };

    extraPlugins = {
      vague-nvim = {
        package = vague-plugin;
        setup = ''
          require("vague").setup({})
          vim.cmd('colorscheme vague')

          vim.api.nvim_set_hl(0, "BlinkIndent", { fg = "#252530" })       -- colors.line

          vim.api.nvim_set_hl(0, "BlinkIndentScope1", { fg = "#6e94b2" }) -- keyword
          vim.api.nvim_set_hl(0, "BlinkIndentScope2", { fg = "#c48282" }) -- func
          vim.api.nvim_set_hl(0, "BlinkIndentScope3", { fg = "#b4d4cf" }) -- builtin
          vim.api.nvim_set_hl(0, "BlinkIndentScope4", { fg = "#bb9dbd" }) -- parameter
        '';
      };
      plenary-nvim = {
        package = pkgs.vimPlugins.plenary-nvim;
      };
      neoscroll-nvim = {
        package = pkgs.vimPlugins.neoscroll-nvim;
        setup = "
        require('neoscroll').setup({
          mappings = {
            '<C-u>', '<C-d>',
            '<C-b>', '<C-f>',
            '<C-y>', '<C-e>',
            'zt', 'zz', 'zb',
          },
          hide_cursor = true,
          stop_eof = true,
          respect_scrolloff = false,
          cursor_scrolls_alone = true,
          duration_multiplier = 1.0,
          easing = 'linear',
          pre_hook = nil,
          post_hook = nil,
          performance_mode = false,
          ignored_events = {
              'WinScrolled', 'CursorMoved'
          },
        })
        ";
      };
    };
  };
}
