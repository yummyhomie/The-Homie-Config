{ inputs, ... }:
let
  theme = "firefoxcss"; # Put theme name here. 
in

{
  # Configure Stylix for Firefox
  stylix.targets.firefox.profileNames = [ "default" ];

  # Copy the ArcWTF theme files to Firefox chrome directory
  home.file.".mozilla/firefox/default/chrome/${theme}".source = inputs.${theme};

  programs.firefox = {
    enable = true;
    
    profiles.default = {
      userChrome = ''
        @import "${theme}/chrome/userChrome.css";
      '';
      
      userContent = ''
        @import "${theme}/chrome/userContent.css"; 
      '';
      
      settings = {
        # Enable CSS customizations
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
