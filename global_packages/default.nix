{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    odin
    github-desktop
  ];
}
