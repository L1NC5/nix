# Enable hardware graphics acceleration and Vulkan support
{
  flake.modules.nixos.graphics =
    { ... }:
    {
      hardware.graphics = {
        enable = true;
      };
    };
}
