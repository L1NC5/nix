{
  flake.modules.nixos.nvf =
    { ... }:
    {
      programs.nvf = {
        enable = true;
        defaultEditor = true;
        settings = {
          vim = {
            viAlias = false;
            vimAlias = true;
            lsp = {
              enable = true;
              formatOnSave = true;
              lightbulb.enable = true;
              lspsaga.enable = false;
              trouble.enable = true;
              lspSignature.enable = true;
            };
            clipboard = {
              enable = true;
              registers = "unnamed";
            };
            comments = {
              comment-nvim = {
                enable = true;
                mappings = {
                  toggleCurrentBlock = "gbc";
                  toggleCurrentLine = "gcc";
                  toggleSelectedBlock = "gb";
                  toggleSelectedLine = "gc";
                };
              };
            };
            mini = {
              ai.enable = true;
              animate.enable = true;
              basics.enable = true;
              clue.enable = true;
              completion.enable = true;
              files.enable = true;
              icons.enable = true;
              indentscope.enable = true;
              move.enable = true;
              notify.enable = true;
              pairs.enable = true;
              pick.enable = true;
            };
          };
        };
      };
    };
}
