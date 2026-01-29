{...}: {
  programs.chromium = {
    enable = true;

    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # uBlock Origin
    ];

    commandLineArgs = [
      "--enable-features=VaapiVideoDecoder,Wayland"
      "--ozone-platform=wayland"
      "--enable-gpu-rasterization"
      "--enable-zero-copy"
    ];
  };
}
