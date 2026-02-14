{
  flake.modules.nixos.laptop-lid =
    { ... }:
    {
      # Handle lid closing
      services.logind.settings.Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "ignore";
      };
    };
}
