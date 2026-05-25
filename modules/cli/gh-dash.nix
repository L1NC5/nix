{
  flake.modules.homeManager.gh-dash =
    { ... }:
    {
      programs = {
        gh-dash = {
          enable = true;
        };
      };
    };
}
