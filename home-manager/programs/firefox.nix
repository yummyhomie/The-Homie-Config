{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies.DefaultDownloadDirectory = "$HOME/Downloads/";
    profiles = {
      profile0 = {
        name = "the-homie-profile";
        isDefault = true;
        id = 0;
        search = {
          default = "ddg";
          force = true;
        };
      };
      profile1 = {
        name = "i2p";
        id = 1;
      };
    };
	  #settings = {
	  #  "general.autoScroll" = true;  # Clicking middle mouse scrolls the page
	  #  "browser.compactmode.show" = true;
    #  "privacy.clearOnShutdown.history" = false;
    #  "privacy.clearOnShutdown.cookies" = false;
    #  "network.cookie.lifetimePolicy" = 0;  # Keep cookies until they expire or are manually deleted
	  #  "browser.toolbars.bookmarks.visibility" = "newtab"; # Only see bookmarks bar on newtab
	  #  "svg.context-properties.content.enabled" = true; # Improves graphics with SVG stuff (I guess)
	  #  "media.hardware-video-decoding.force-enabled" = true; # Improves video playback by using GPU instead of CPU (Haven't seen a difference yet)
	  #  "toolkit.tabbox.switchByScrolling" = true; # Switch tabs by scrolling with the mouse
	  #  "device.sensors.motion.enabled" = false; # Privacy. Disables sites from accessing device motion events.
    #};
  };
}
