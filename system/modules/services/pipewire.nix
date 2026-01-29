{ ... }:
{
  services = {
    pulseaudio.enable = false;
    pipewire = {
      # surround.enable = true;
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
  };
}
