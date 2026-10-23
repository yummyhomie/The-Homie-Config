{ hostname, ... }:
let
  monitor =
    if hostname == "the-homie-machine"
    then "DP-3"
    else "eDP-1";
in
{
  programs.yambar = {
    enable = true;
    settings = {
      bar = {
        height = 25;
        monitor = monitor;
        location = "bottom";
        background = "1a121080";
        foreground = "9c8474ff";
        layer = "bottom";
        font = "IoskeleyMonoTerm Nerd Font Heavy:style=Heavy:pixelsize=14";
        margin = 4;
        border = {
          color = "ef350eff";
          width = 2;
          margin = 8;
          top-margin = 0;
          bottom-margin = 0;
        };

        left = [
          {
            clock = {
              date-format = "%b %d";
              time-format = "%I:%M";
              content = { string.text = "{date} {time}  "; };
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
                            text = "󰈀 {ipv4}  "; 
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
                            text = "󰖩 {ipv4}  "; 
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
                            text = "󰖩 {ipv4}  "; 
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
                              tag = "cubic_volume";
                              items = [
                                { string.text = "  "; }
                                { string.text = " {cubic_volume}  "; }
                                { string.text = " {cubic_volume}  "; }
                                { string.text = " {cubic_volume}  "; }
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
            removables = {
              content.map.conditions = {
                "label == \"EFI\"" = {
                  string.text = "";
                };
                
                "~mounted" = {
                  string = {
                    on-click = "udisksctl mount -b {device}";
                    text = "󱇰";
                  };
                };

                "mounted" = {
                  string = {
                    on-click = "udisksctl unmount -b {device}";
                    text = "󱇰 {label}";
                    deco = {
                      underline = {
                        size = 2;
                        color = "8a9a4aff";
                      };
                    };
                  };
                };
              };
            };
          }
        ];

        center = [
          {
            foreign-toplevel = {
              "all-monitors" = true;
              content.map.conditions = {
                "activated" = { string.text = "{app-id}: {title}"; };
              };
            };
          }
        ];

        right = [
          {
            cpu = {
              poll-interval = 2500;
              content.map.conditions = {
                "id < 0" = {
                  string.text = " {cpu} ";
                };
              };
            };
          }
          {
            mem = {
              poll-interval = 2500;
              content.map = { 
                default = { string.text = " {percent_used} "; };
                conditions = {
                  "percent_used == 0" = { string.text = "  "; };
                };
              };
            };
          }
          {
            script = {
              path = "${./custom-scripts/gpu.sh}";
              poll-interval = 2500;
              content.map = {
                default = { string.text = "󰭴 {gpu} "; };
                conditions = {
                  "gpu == 0" = { string.text = "󰭴 "; };
                };
              };
            };
          }
          {
            battery = {
              name = "BAT0";
              poll-interval = 30000;
              content = {
                map = {
                  default = { string.text = "󰂁{capacity}%"; };
                  conditions = {
                    "capacity == 0" = { string.text = ""; };
                    "capacity == 100" = { string.text = "󰁹"; };
                    "state == charging" = { string.text = "󰂄{capacity}%"; };
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
