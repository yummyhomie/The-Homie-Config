{ pkgs, config, ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set number 
      set nowrap
      set mouse=a

      set showtabline=2

      syntax on
      set autoindent
      set smartindent

      set laststatus=2
      set showmatch
      set cursorline
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      auto-pairs

    ];
  };
}
