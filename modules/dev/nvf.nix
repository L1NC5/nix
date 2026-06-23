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
              animate.enable = true;
              basics.enable = true;
            };
          };
        };
      };
    };
}
