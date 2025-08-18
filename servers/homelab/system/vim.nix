{ pkgs, config, ... }:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      set number 
      set nowrap
      set mouse=a

      let &t_SI = "\e[6 q"
      let &t_EI = "\e[2 q"

      colorscheme gruvbox
      set background=dark

      set showtabline=2

      syntax on
      set autoindent
      set smartindent

      set laststatus=2
      set showmatch
      set cursorline
    '';

    plugins = with pkgs.vimPlugins; [
      gruvbox         # For gruvbox theme
      auto-pairs      # Automatically fill in brackets, semi-colons, etc.
      nvchad          # Let's see if this works.
      ale             # Code/Syntax error catcher
      lightline-vim   # Status Bar
      lightline-ale   # Status Bar addon that works with ALE
      nerdtree        # Directory viewer for projects (NERDTreeToggle, use ctrl+w h (left) and ctrl+w l (right) to switch between windows)
    ];
  };
}
