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
    my-nix-overlay = {
      from = {
        id = "my-nix-overlay";
        type = "indirect";
      };
      to = {
        owner = "hcssmith";
        repo = "my-nix-overlay";
        type = "github";
      };
    };
  };
}
