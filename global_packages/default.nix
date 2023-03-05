{config, pkgs, ...}:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    terminus-nerdfont
    terminus_font
    blackbox-terminal
  ];
}
