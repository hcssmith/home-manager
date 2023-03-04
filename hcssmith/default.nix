{ config, pkgs, ... }:
{
  home = {
    homeDirectory = "/var/home/hcssmith";
    username = "hcssmith";
    stateVersion = "22.11";
  };
}
