{ config, pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles."the-homie-profile" = {
      isDefault = true;
      search.default = "ddg";
    };
  };
}
