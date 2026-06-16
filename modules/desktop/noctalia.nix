{ noctaliaModule, ... }:
{
  flake.modules.homeManager.noctalia =
    { ... }:
    {
      imports = [
        noctaliaModule
      ];

      programs.noctalia = {
        enable = true;
      };
    };
}
