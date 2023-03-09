{config, pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./init.lua;

    extraPackages = with pkgs; [
      rnix-lsp
    ];

    plugins = with pkgs.vimPlugins; [
      vim-nix
      telescope-nvim
      nvim-treesitter
      nvim-lspconfig
      nvim-tree-lua
      vim-miranda
      nvim-web-devicons
      odin-vim
    ];

  };
}
