{ config, hostname, ... }:
let
  hwmonPath = 
  if hostname == "the-homie-laptop" then "/sys/class/hwmon/hwmon4/temp1_input"
  else if hostname == "the-homie-machine" then "/sys/class/hwmon/hwmon0/temp1_input"
  else abort "Unknown hostname ${hostname}. Set correct hostname!";
in
{ 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        
        modules-left = [ 
          "clock"
          "clock#clock2"
          "privacy"
        ];  
        
        modules-center = [ ];

        modules-right = [  
          "network"
          "network#network2"
          "bluetooth"
          "pulseaudio"
          "pulseaudio/slider"
          "battery"
          
          "cpu"
          "memory"
          "disk"
          "temperature"
        ];

        clock = {
          format = "{:%A, %B %d}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "weeks" = "<span color='#fa6122'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#fa6122'><b><u>{}</u></b></span>";
            };
          };
        };
        
        "clock#clock2" = {
          interval = 60;
          format = "{:%I:%M %p}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "weeks" = "<span color='#fa6122'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#fa6122'><b><u>{}</u></b></span>";
            };
          };
        };

        "privacy" = {
          "icon-spacing" = 4;
          "icon-size" = 32;
          "transition-duration" = 250;
          "modules" = [
            {
              "type" = "screenshare";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
            {
              "type" = "audio-out";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
            {
              "type" = "audio-in";
              "tooltip" = true;
              "tooltip-icon-size" = 24;
            }
          ];
          "ignore-monitor" = true;
          "ignore" = [
            {
              "type" = "audio-in";
              "name" = "cava";
            }
            {
              "type" = "screenshare";
              "name" = "obs";
            }
          ];
        };

        network = {
          format-wifi = " {ipaddr}";
          format-ethernet = " {ipaddr}";
          format-disconnected = "";
          on-click = "foot sudo nmtui";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
        };
        
        "network#network2" = {
          interval = 4;
          format-wifi = " {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-ethernet = " {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-disconnected = "";
          on-click = "foot sudo nmtui";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
        };

        bluetooth = {
          format =  "";
          on-click = "foot bluetuith"; 
          format-on = " {status}";
          format-connected = " {device_battery_percentage}";
          tooltip-format-connected = "Connected:\n{device_alias}";
          tooltip-format-disconnected = "Disconnected!";
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "{icon}";
          format-icons = {
            default = ["" "" "" ""];
            headphone = ["" "" "" ""];
          };
          tooltip-format = "{desc}\nVolume: {volume}%";
          on-click = "foot pulsemixer";
        };
        
        "pulseaudio/slider" = {
          "min" = 0;
          "max" = 100;
          "orientation" = "horizontal";
        };

        battery = {
          "states" = {
            "good" = 100;
            "normal" = 98;
            "warning" = 40;
            "critical" = 15;  
          };
          format = "{icon}";
          format-charging = "";
          #"format-plugged" = " {capacity}%";
          #"format-discharging" = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
          tooltip-format = "Battery at {capacity}%";
        };

        cpu = {
          interval = 4;
          format = " {usage}%";
          tooltip-format = "CPU Usage: {usage}";
          "states" = {
            "good" = 55;
            "warning" = 70;
            "critical" = 85;
          };
        };

        memory = {
          interval = 4;
          format = " {percentage}%";
          tooltip-format = "Memory Usage: {used:0.1f}GiB used";
          "states" = {
            "warning" = 70;
            "critical" = 85;
          };
        };

        disk = {
          interval = 80;
          format = " {free}";
          tooltip-format = " Disk Free: {free}";
          path = "/";
        };

        temperature = {
          interval = 4;
          format = "{icon} {temperatureC}°C";
          tooltip = true;
          tooltip-format = "Temp: {temperatureC}°C";
          hwmon-path = hwmonPath;
          format-icons = ["" "" "" "" ""];
          critical-threshold = 75;
          format-critical = "{icon}";
        };
      };
    };

    # Notes
    # Old Text Color: 
    # color: #d4be98;

    style = ''
      * {
        border: none;
        padding: 0px;
        margin: 0px;

        font-family: Trebuchet;
        font-size: 16px;
        font-weight: bold;

        color: #d0c8c6;
        background-color: transparent;
      }

      .modules-left,
      .modules-right,
      .modules-center {
        padding: 2px 4px 2px 4px;
      }

      /* Backgrounds & Borders */
      #clock,
      #clock.clock2,
      #network,
      #network.network2,
      #bluetooth,
      #pulseaudio,
      #pulseaudio-slider,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature {
        padding: 4px;
        border-width: 2px;
        border-style: solid;
        border-color: #7e705a;
        background-color: #3B3228;
      }

      /* Margins 4 Each Side */
      #clock,
      #clock.clock2 {
        margin-right: 8px;
      }

      #network,
      #bluetooth,
      #pulseaudio,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature {
        margin-left: 8px;
      }

      /* Details */
      
      #bluetooth.connected {
        color: #00bfff;
      }

      #pulseaudio {
        border-right: 0px hidden;
      }

      #pulseaudio-slider {
        border-left: 0px hidden;
      }

      #pulseaudio-slider {
        margin: 0;
      }

      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 0px;
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
      }

      #pulseaudio-slider trough {
        min-height: 10px;
        min-width: 80px;
        border-radius: 5px;
        background: black;
      }

      #pulseaudio-slider highlight {
        min-width: 10px;
        border-radius: 4px;
        background: #d0c8c6;
      }
      
      #battery.good { color: #A9B665; }
      #battery.normal { color: #D4BE98; }
      #battery.warning { color: #D8A657; }
      #battery.critical { color: #EA6962; }
      
      #cpu.good { color: #A9B665; }
      #cpu.warning { color: #D8A657; }
      #cpu.critical { color: #EA6962; }
      
      #memory.warning { color: #D8A657; }
      #memory.critical { color: #EA6962; }
      
      #temperature.critical { color: #EA6962; }
    '';        
  };

  # OG font color: #e2daae; Also cool dark color -> #322d28;
  # Background that matches Foot terminal background/opacity rgba(40, 40, 40, 0.9); 
}

