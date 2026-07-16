{
  config.vim = {
    diagnostics = {
      enable = true;
      presets = {
        eslint_d.enable = true;
        htmlhint.enable = true;
      };
    };
    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
      bash.enable = true;
      css.enable = true;
      json.enable = true;
      nix = {
        enable = true;
        lsp = {
          enable = true;
          servers = ["nixd"];
        };
      };
      html = {
        enable = true;
        lsp.enable = true;
        treesitter.autotagHtml = true;
      };
      tsx = {
        enable = true;
        format.type = [
          "biome"
          # "prettier"
        ];
      };
      typescript = {
        enable = true;
        extensions.ts-error-translator.enable = true;
        extraDiagnostics = {
          enable = true;
          types = [
            "eslint_d"
          ];
        };
        format.type = [
          "biome"
          # "prettier"
        ];
      };
    };

    autocomplete = {
      blink-cmp = {
        enable = true;
        setupOpts = {
          completion = {
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 200;
              treesitter_highlighting = true;
            };
          };
        };
        mappings = {
          next = "<C-N>";
          previous = "<C-P>";
          confirm = "<CR>";
          close = "<C-e>";
        };
      };
    };

    autopairs.nvim-autopairs.enable = true;
    lsp = {
      enable = true;
      otter-nvim.enable = true;
      presets = {
        bash-language-server.enable = true;
        tailwindcss-language-server.enable = true;
      };
      servers = {
        bash-language-server = {
          filetypes = [
            "bash"
            "sh"
          ];
        };
        tailwindcss-language-server = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = [
                  ["cva\\(([^)]*)\\)" "[\"'`]([^\"'`]*)[\"'`]"]
                  ["clsx\\(([^)]*)\\)" "[\"'`]([^\"'`]*)[\"'`]"]
                  ["cx\\(([^)]*)\\)" "[\"'`]([^\"'`]*)[\"'`]"]
                  ["\\w*Config\\s*=\\s*\\{([^}]*)\\}" "[\"'`]([^\"'`]*)[\"'`]"]
                ];
              };
            };
          };
        };
        nixd = {
          settings = {
            nixd = {
              nixpkgs.expr = "import <nixpkgs> { }";
              formatting.command = ["nixfmt"];
              fallback_target = "nvf";
              options = {
                nixos.expr = "(import ./nixd-options.nix).nixos";
                home-manager.expr = "(import ./nixd-options.nix).home-manager";
                nvf.expr = "(import ./nixd-options.nix).nvf";
              };
            };
          };
        };
      };
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters = {
          biome = {
            args = ["check" "--write" "--stdin-file-path" "$FILENAME"];
            stdin = true;
            require_cwd = true;
          };
          eslint_d = {
            require_cwd = true;
          };
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = false;
        };
        notify_on_error = true;
        notify_no_formatters = true;
      };
    };
    luaConfigRC = {
      biome-lsp = ''
        vim.lsp.config('biome', {
          cmd = { 'biome', 'lsp-proxy' },
          filetypes = {
            'astro', 'css', 'graphql', 'html',
            'javascript', 'javascriptreact',
            'json', 'jsonc', 'svelte',
            'typescript', 'typescriptreact', 'vue',
          },
          root_dir = function(bufnr, on_dir)
            local root_files = { 'biome.json', 'biome.jsonc' }
            local fname = vim.api.nvim_buf_get_name(bufnr)
            local found = vim.fs.find(root_files, { path = fname, upward = true })[1]
            if found then
              on_dir(vim.fs.dirname(found))
            end
          end,
          workspace_required = true,
        })

        vim.lsp.enable('biome')
      '';
      disable-lsp-document-colors = ''
        vim.lsp.document_color.enable(false)
      '';
    };
  };
}
