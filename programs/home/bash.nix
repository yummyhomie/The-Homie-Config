{ hostname, host, type, ... }:
{
# bashrc
  programs.bash = {
    enable = true;
    initExtra = ''
      #PS1="$green\u@\h$end $yellow\@$end $purple\w$end: "
      PS1='\[\e[38;5;93;1m\][\[\e[38;5;202m\]\h\[\e[0m\] \[\e[38;5;208;1m\]\A\[\e[0m\] \[\e[38;5;214;1m\]\w\[\e[38;5;93m\]]\[\e[0m\] '
      
      alias ls='ls --color=auto'
      alias grep='grep --color=auto'

      alias edit='vim ~/The-Homie-Config/programs/home/shared-configs/${type}.nix'
      alias nixos='sudo vim ~/The-Homie-Config/programs/nixos/shared-configs/${type}.nix'
      alias flake='vim ~/The-Homie-Config/flake.nix'
      alias rebuild='sudo nixos-rebuild switch --flake ~/The-Homie-Config#${hostname}'
      alias switch='home-manager switch --flake ~/The-Homie-Config#${hostname}'
      alias config='vim ~/The-Homie-Config/machines/${host}/config.nix'

      alias bash='vim ~/The-Homie-Config/programs/home/bash.nix'
      alias ni='vim ~/The-Homie-Config/programs/window-manager/niri/config.kdl'
      alias stylix='vim ~/The-Homie-Config/programs/home/stylix-home.nix'
      alias way='vim ~/The-Homie-Config/programs/home/waybar.nix'
    '';
  };
}
