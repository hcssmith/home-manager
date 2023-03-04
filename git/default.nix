{config, pkgs, ...}:
{
  programs.git = {
    enable =  true;
    userName = "hcssmith";
    userEmail = "me@hcssmith.com";
  };
}
