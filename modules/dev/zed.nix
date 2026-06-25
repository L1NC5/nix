{ ... }:
{
  flake.modules.homeManager.zed =
    { pkgs, ... }:
    {
      programs.zed-editor = {
        enable = true;
        extraPackages = with pkgs; [
          nixd
          nixfmt
        ];
        mutableUserSettings = true;

        userSettings = {
          "lsp" = {
            "nixd" = {
              "settings" = {
                "nixpkgs" = {
                  "expr" = "import <nixpkgs> {}";
                };
                "options" = {
                  "nixos" = {
                    "expr" = "(builtins.getFlake \"${../../.}\").nixosConfigurations.alchemist.options";
                  };
                  "home-manager" = {
                    "expr" =
                      "(builtins.getFlake \"${../../.}\").nixosConfigurations.alchemist.options.home-manager.users.type.nestedTypes.elemType.getSubOptions []";
                  };
                };
                "diagnostic" = {
                  "suppress" = [ "unbound-variable" ];
                };
                "formatting" = {
                  "command" = [ "nixfmt" ];
                };
                "fallback_target" = "home-manager";
              };
            };
          };
        };
      };
    };
}
