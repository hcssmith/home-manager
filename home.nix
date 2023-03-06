{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  nix.registry = {
    toolbox = {
      from = {
        id = "toolbox";
        type = "indirect";
      };
      to = {
        owner = "hcssmith";
        repo = "toolbox";
        type = "github";
      };
    };
  };
}
