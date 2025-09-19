{ pkgs, config, ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set number 
      set nowrap
      set mouse=a

      let &t_SI = "\e[6 q"
      let &t_EI = "\e[2 q"

      set showtabline=2

      syntax on
      set autoindent
      set smartindent

      set laststatus=2
      set showmatch
      set cursorline

      set foldmethod=marker
      set foldlevel=0
      set foldenable
      set foldcolumn=1
    '';

    # colorscheme gruvbox
    # set background=dark
    
    plugins = with pkgs.vimPlugins; [
      #gruvbox         # For gruvbox theme
      auto-pairs      # Automatically fill in brackets, semi-colons, etc.
      nvchad          # Let's see if this works.
      ale             # Code/Syntax error catcher
      lightline-vim   # Status Bar
      lightline-ale   # Status Bar addon that works with ALE
    ];
  };
}
