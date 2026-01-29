{inputs, ...}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      appLauncher = {
        terminalCommand = "kitty";
      };

      bar = {
        position = "top";
        density = "default";
        transparent = true;
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = 1;
        floating = false;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        outerConrners = true;
        widgets = {
          left = [
            {
              id = "Workspace";
            }
            {
              id = "ActiveWindow";
            }
          ];
          center = [
            {
              id = "Clock";
            }
          ];
          right = [
            {
              id = "ScreenRecorder";
            }
            {
              id = "Tray";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Battery";
            }
            {
              id = "Brightness";
            }
            {
              id = "Volume";
            }
            {
              id = "ControlCenter";
            }
          ];
        };
      };

      dock.enabled = false;

      general = {
        lockOnSuspend = true;
      };

      location = {
        name = "Livorno";
        weatherEnabled = true;
      };
    };
  };
}
