{
  programs.yambar = {
    enable = true;
    settings = {
      bar = {
        height = 26;
        location = "bottom";
        background = "1a1210ff";
        foreground = "9c8474ff";
        layer = "overlay";

        left = [
          {
            clock = {
              date-format = "%b %d";
              time-format = "%I:%M";
              content = { string.text = "{date} {time}"; };
            };
          }
        ];

        right = [
          {
            cpu = {
              poll-interval = 2500;
              content = {
                map.conditions = {
                  "id < 0" = {
                    string.text = "CPU: {cpu}%";
                  };
                };
              };
            }; 
          }
          {
            mem = {
              poll-interval = 2500;
              content = { string.text = "MEM: {percent_used}%"; };
            };
          }

        ];

      };
    };
  };
}
