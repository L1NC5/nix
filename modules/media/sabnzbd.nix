{
  flake.modules.nixos.sabnzbd = {
    services.sabnzbd = {
      enable = true;
      openFirewall = true;
    };
  };
}
