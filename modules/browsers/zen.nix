{
  flake.modules.homeManager.zen-browser =
    { inputs, pkgs, ... }:
    {
      imports = [
        inputs.zen-browser.homeModules.beta
      ];

      programs.zen-browser = {
        enable = true;

        policies = {
          AutofillAddressEnabled = true;
          AutofillCreditCardEnabled = false;
          DisableAppUpdate = true;
          DisableFeedbackCommands = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DontCheckDefaultBrowser = true;
          NoDefaultBookmarks = true;

          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
        };

        profiles.default = {
          isDefault = true;

          extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
            ublock-origin
            sponsorblock
            bonjourr-startpage
            react-devtools
          ];

          settings = {
            "zen.view.compact.enable-at-startup" = false;
            "zen.view.sidebar-expanded" = false;
            "zen.view.use-single-toolbar" = true;
            "zen.view.show-newtab-button-top" = false;
            "zen.view.animations.enabled" = false;
            "zen.welcome-screen.seen" = true;

            "browser.fullscreen.autohide" = true;
            "browser.fullscreen.animate" = false;
            "toolkit.cosmeticAnimations.enabled" = false;

            "gfx.webrender.all" = true;
            "gfx.webrender.compositor" = true;
            "layers.acceleration.force-enabled" = true;
            "widget.dmabuf.force-enabled" = true;

            "media.ffmpeg.vaapi.enabled" = true;
            "media.hardware-video-decoding.force-enabled" = true;
            "media.av1.enabled" = false;
          };
        };
      };
    };
}
