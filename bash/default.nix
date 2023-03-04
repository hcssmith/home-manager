{config, pkgs, ...}:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      . /var/home/hcssmith/.nix-profile/etc/profile.d/nix.sh
    '';
  };
}
