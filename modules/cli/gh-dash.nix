{
  flake.modules.homeManager.gh-dash =
    { ... }:
    {
      programs = {
        gh = {
          enable = true;
        };
        gh-dash = {
          enable = true;
        };
      };
    };
}
