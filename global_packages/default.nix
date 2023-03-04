{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    odin
    github-desktop
    source-code-pro
    terminus-nerdfont
    terminus_font
  ];
}
