{config, pkgs, ...}:
{
  programs.bash = {
    enable = true;
    bashrcExtra = "
      alias ls='ls --color=auto'
      alias grep='grep --color=auto'
      PS1='[\u@\h \W]\$'

      alias edit='lvim ~/.config/home-manager/home.nix'
      alias switch='home-manager switch'
      alias hypr='lvim ~/.config/hypr/hyprland.conf'
      alias p='hyprshot -m region --clipboard-only'
      alias way='lvim ~/.config/home-manager/waybar/waybar.nix'
    ";
  };
}
