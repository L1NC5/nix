{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/shared
    ../../modules/linux/desktop
  ];

  home = {
    username = "l1nc5";
    homeDirectory = "/home/l1nc5";
    packages = with pkgs; [
      home-manager
      yazi
      ripgrep
      jq
      eza
      fzf
      mtr
    ];
    stateVersion = "25.11";
  };

  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };
  };
}
