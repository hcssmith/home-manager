{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  home.homeDirectory = "/var/home/hcssmith";
  home.username = "hcssmith";
  # paths it should manage.
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = builtins.readFile ./init.vim;
    extraPackages = with pkgs; [
      rnix-lsp
    ];
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-csharp
      vim-go
      vim-airline
      vim-javascript
      vim-airline
      vim-airline-themes
      vim-fugitive
      vim-gitgutter
      NeoSolarized
      nerdtree
      nvim-lspconfig
      direnv-vim
    ];

  };

  programs.bash = {
    enable = true;
  };

  home.packages = with pkgs; [
    odin
    github-desktop
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
