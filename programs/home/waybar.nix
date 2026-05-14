{ config, hostname, pkgs, ... }:
let
  hwmonPath = 
  if hostname == "the-homie-laptop" then "/sys/class/hwmon/hwmon4/temp1_input"
  else if hostname == "the-homie-machine" then "/sys/class/hwmon/hwmon0/temp1_input"
  else abort "Unknown hostname ${hostname}. Set correct hostname!";

  waybarOutput =
  if hostname == "the-homie-laptop" then "eDP-1"
  else if hostname == "the-homie-machine" then [ "DP-3" ]
  else "";
in  
{ 
  programs.waybar = {
    enable = true;
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        output = waybarOutput;
        
        modules-left = [ 
          "clock"
          
          "custom/vpn"
          "network"
          "bluetooth"
          "pulseaudio"
          "pulseaudio/slider"
          "battery"
          
          "privacy"
        ];  
        
        modules-center = [ 
        ];

        modules-right = [ 
          "cpu"
          "memory"
          "disk"
          "temperature"
        ];

        clock = {
          interval = 60;
          format = "{:%B %d, %I:%M %p}";
        };

        "custom/vpn" = {
          format = "";
          exec = "echo '{\"class\": \"connected\"}'";
          exec-if = "test -d /proc/sys/net/ipv4/conf/airvpn";
          return-type = "json";
          interval = 8;
        };

        network = {
          format-wifi = " {ipaddr}";
          format-ethernet = " {ipaddr}";
          format-disconnected = "";
          on-click = "kitty sudo nmtui";
          tooltip-format = "Connected to {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%";
          tooltip-format-ethernet = "IP: {ipaddr}\nInterface: {ifname}";
          tooltip-format-disconnected = "Disconnected";
        };
        
        bluetooth = {
          format =  "";
          on-click = "kitty bluetuith"; 
          format-on = "";
          format-connected = "";
          tooltip-format-connected = "Connected: {device_alias}";
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
          on-click = "kitty pulsemixer";
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

        #cpu = {
        #  interval = 4;
        #  format = " {usage}%";
        #  tooltip-format = "CPU Usage: {usage}";
        #  "states" = {
        #    "good" = 55;
        #    "warning" = 70;
        #    "critical" = 85;
        #  };
        #};
      cpu = {
        interval = 1;
        format = " {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}";
        format-icons = [
          "<span color='#69ff94'>▁</span>"
          "<span color='#2aa9ff'>▂</span>"
          "<span color='#f8f8f2'>▃</span>"
          "<span color='#f8f8f2'>▄</span>"
          "<span color='#ffffa5'>▅</span>"
          "<span color='#ffffa5'>▆</span>"
          "<span color='#ff9977'>▇</span>"
          "<span color='#dd532e'>█</span>"
        ];
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
          format-critical = "{icon}";
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
      };
    };

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
        background: black;
      }

      /* Backgrounds & Borders */

      #clock,
      #custom-vpn,
      #network,
      #bluetooth,
      #pulseaudio,
      #pulseaudio-slider,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #privacy {
        padding: 8px;
        margin-left: 1px;
        margin-right: 1px;
        
        border-width: 2px;
        border-style: solid;
        border-color: #505050;
      }

      #clock { 
        border-top-left-radius: 8px;
        border-bottom-left-radius: 8px;
      }
      
      #temperature { 
        border-top-right-radius: 8px;
        border-bottom-right-radius: 8px;
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

