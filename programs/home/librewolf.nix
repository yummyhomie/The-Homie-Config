{
  programs.librewolf = {
    enable = true;

    profiles = {
      Default = {
        extensions.force = true;
      };
    };

    settings = {
      "identity.fxaccounts.enabled" = true;
      "ui.key.menuAccessKeyFocuses" = false;
    };
  };
}
