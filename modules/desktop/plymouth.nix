{
  flake.modules.nixos.plymouth =
    { pkgs, ... }:
    {
      boot = {
        plymouth = {
          enable = true;
          theme = "hexagon";
          themePackages = [
            (pkgs.adi1090x-plymouth-themes.override {
              selected_themes = [ "hexagon" ];
            })
          ];
        };
        consoleLogLevel = 0;
        initrd.verbose = false;
        kernelParams = [
          "quiet"
          "splash"
          "boot.shell_on_fail"
          "udev.log_priority=3"
          "rd.systemd.show_status=auto"
        ];
      };
    };
}
