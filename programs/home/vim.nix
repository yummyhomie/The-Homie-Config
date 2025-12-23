{ pkgs, config, ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      " Line numbers, no line wrapping, mouse support
      set number  
      set nowrap
      set mouse=a

      " Cursor Shape changes based on mode. (Normal or Insert)
      let &t_SI = "\e[6 q"
      let &t_EI = "\e[2 q"

      " Set tab space to 2 spaces
      set showtabline=2

      " Automatic Indent
      set autoindent
      set smartindent

      " Always show status line
      set laststatus=2

      " Highlight matching brackets      
      set showmatch
    '';
    
    plugins = with pkgs.vimPlugins; [
      auto-pairs      # Automatically fill in brackets, semi-colons, etc.
      ale             # Code/Syntax error catcher
      lightline-vim   # Status Bar
      lightline-ale   # Status Bar addon that works with ALE
      vim-polyglot     # Syntax Highlighting 
      vim-fugitive    # Git Wrapper so Awesome it should be illegal
      nerdtree        # VIM File Explorer
      vim-nerdtree-syntax-highlight
      tailwind-tools-nvim
    ];
  };
}
