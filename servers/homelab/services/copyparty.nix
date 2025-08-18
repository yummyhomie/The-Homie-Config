{
  services.copyparty = {
    enable = true;
  settings = {
    i = "0.0.0.0";
    # use lists to set multiple values
    p = [ 3210 3211 ];
    # use booleans to set binary flags
    no-reload = true;
    # using 'false' will do nothing and omit the value when generating a config
    ignored-flag = false;
  };

  accounts = {
    ed = {
      passwordFile = "/home/erik/The-Homie-Server/ed_password";
    };
  };

  # create a volume
  volumes = {
    # create a volume at "/" (the webroot), which will
    "/" = {
      # share the contents of "/srv/copyparty"
      path = "~/Files";
      # see `copyparty --help-accounts` for available options
      access = {
        # everyone gets read-access, but
        r = "*";
        # users "ed" gets read-write
        rw = [ "ed" ];
      };
      # see `copyparty --help-flags` for available options
      flags = {
        # "fk" enables filekeys (necessary for upget permission) (4 chars long)
        fk = 4;
        # scan for new files every 60sec
        scan = 60;
        # volflag "e2d" enables the uploads database
        e2d = true;
        # "d2t" disables multimedia parsers (in case the uploads are malicious)
        d2t = true;
        # skips hashing file contents if path matches *.iso
        nohash = "\.iso$";
      };
    };
  };
  # you may increase the open file limit for the process
  openFilesLimit = 8192;
};
}
