{
# bashrc
  programs.bash = {
    enable = true;
    initExtra = '' 
      alias ls='ls --color=auto'
      alias grep='grep --color=auto'

      alias nixos='sudo vim ~/The-Homie-Server/nixos/configuration.nix'
      alias rebuild='sudo nixos-rebuild switch --flake ~/The-Homie-Server#the-homie-server'

      alias services='cd ~/The-Homie-Server/nixos/services'
      alias system='cd ~/The-Homie-Server/home/system'

      alias edit='vim ~/The-Homie-Server/home/home.nix'
      alias switch='home-manager switch --flake ~/The-Homie-Server#erik'
      
      alias flake='vim ~/The-Homie-Server/flake.nix'
    '';
  };
}
