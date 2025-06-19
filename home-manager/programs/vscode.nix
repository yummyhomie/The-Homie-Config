{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles."the-homie-profile" = {
      extensions = with pkgs.vscode-extensions; [
        bradlc.vscode-tailwindcss
        github.copilot
        jdinhlife.gruvbox
        pkief.material-icon-theme
      ];
      userSettings = {
        "workbench.sideBar.location" = "right";
        "workbench.colorTheme" = "Gruvbox Dark Soft";
        "workbench.iconTheme" = "material-icon-theme";  
      };
    };
  };
}
