{
  # system specific:
  # configure audio interface's LEDs when loading is complete
  flake.modules.nixos.alchemist-led =
    { pkgs, ... }:
    {
      services.udev.extraRules = ''
        SUBSYSTEM=="sound", ACTION=="add", KERNEL=="controlC*", RUN+="${pkgs.bash}/bin/bash -c 'sleep 1; echo follow-route > /sys/class/sound/ctl-led/mic/mode; echo off > /sys/class/sound/ctl-led/speaker/mode'"
      '';
    };
}
