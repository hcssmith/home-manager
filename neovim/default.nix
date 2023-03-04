{config, pkgs, ...}:
{
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
}
