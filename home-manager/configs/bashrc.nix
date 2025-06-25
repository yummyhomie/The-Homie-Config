{
# bashrc
  programs.bash = {
    enable = true;
    initExtra = ''
      #Color variables cuz I like to switch colors alot NOTE: This may not work with all terminal emulators
      red="\[\033[01;31m\]"
      yellow="\[\033[01;33m\]"
      green="\[\033[01;32m\]"
      blue="\[\033[01;34m\]"
      purple="\[\033[01;35m\]"
      cyan="\[\033[01;36m\]"
      white="\[\033[01;37m\]"
      black="\[\033[01;30m\]"
      end="\[\\033[00m\]"

      # black=30 blue=34 cyan=36 green=32 purple=35 red=31 white=37 yellow=33

      # Other variables cuz trying new things is fun
      bold="\e[1m"
      italics="\e[3m"
      under="\e[4m"
      strike="\e[9m"
      varEnd="\e[0m"

      # bold=1 italic=3 underline=4 strikethrough=9

      PS1="$green\u@\h$end $blue\w$end $yellow\@$end: "

      alias ls='ls --color=auto'
      alias grep='grep --color=auto'

      alias edit='vim ~/The-Homie-Config/home-manager/home.nix'
      alias switch='home-manager switch'
      alias bash='vim ~/The-Homie-Config/home-manager/configs/bashrc.nix'
      alias hypr='vim ~/The-Homie-Config/hypr/hyprland.conf'
      alias way='vim ~/The-Homie-Config/home-manager/configs/waybar.nix'
      alias nixos='sudo vim ~/The-Homie-Config/nixos/configuration.nix'
      alias rebuild='sudo nixos-rebuild switch'
      alias ala='vim ~/The-Homie-Config/home-manager/programs/alacritty.nix'
    '';
  };
}
