{
  programs.yambar = {
    enable = true;
    settings = {
      bar = {
        height = 26;
        location = "top";
        background = "1a121000";
        foreground = "9c8474ff";
        layer = "overlay";
        font = "IoskeleyMonoTerm Nerd Font Heavy:style=Heavy:pixelsize=14";

        left = [
          {
            clock = {
              date-format = "%b %d";
              time-format = "%I:%M";
              content = { string.text = "{date} {time} |"; };
            };
          }
          {
            network = {
              content = {
                map = { 
                  default = { string.text = ""; };
                  conditions = { 
                    "name == \"enp42s0\"" = {
                      map = { 
                        default = { 
                          string = { 
                            text = "󰈀 {ipv4} | "; 
                            on-click = "kitty sudo nmtui";    
                          };
                        };
                        conditions = {
                          "state == \"down\"" = { string.text = ""; };
                        };
                      };
                    };
                    "name == \"wlp41s0\"" = {
                      map = { 
                        default = { 
                          string = { 
                            text = " 󰖩 {ipv4} | "; 
                            on-click = "kitty sudo nmtui";    
                          };
                        };
                        conditions = {
                          "state == \"down\"" = { string.text = ""; };
                        };
                      };
                    };
                    "name == \"wlp3s0\"" = {
                      map = { 
                        default = { 
                          string = { 
                            text = " 󰖩 {ipv4} | "; 
                            on-click = "kitty sudo nmtui";    
                          };
                        };
                        conditions = {
                          "state == \"down\"" = { string.text = ""; };
                        };
                      };
                    };
                  };
                };
              };
            };
          }
          {
            pipewire = {
              content = {
                list = {
                  items = [
                    {
                      map = {
                        conditions = {
                          "type == \"sink\"" = {
                            ramp = {
                              tag = "linear_volume";
                              items = [
                                { string.text = "󰕿 {linear_volume}% "; }
                                { string.text = "󰖀 {linear_volume}% "; }
                                { string.text = "󰕾 {linear_volume}% "; }
                              ];
                              on-click = {
                                left = "kitty pulsemixer";
                                right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                                wheel-up = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 2%+";
                                wheel-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";
                              };
                            };
                          };
                        };
                      };
                    }
                  ];
                };
              };
            };
          }
          {
            cpu = {
              poll-interval = 2500;
              content = {
                map.conditions = {
                  "id < 0" = {
                    string.text = " {cpu}% ";
                  };
                };
              };
            }; 
          }
          {
            mem = {
              poll-interval = 2500;
              content = { string.text = " {percent_used}% "; };
            };
          }
          {
            battery = {
              name = "BAT0";
              poll-interval = 30000;
              content = { string.text = "󰂁{capacity}% "; };
            };
          }
        ];
      };
    };
  };
}
