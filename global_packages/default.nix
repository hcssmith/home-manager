{config, pkgs, ...}:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    terminus-nerdfont
    st-hcs
    dmenu
    terminus_font
    blackbox-terminal
  ];
}
