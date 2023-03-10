{config, pkgs, ...}:

{
  services.plan9port = {
    fontsrv.enable = true;
    plumber.enable = true;
  };
}
