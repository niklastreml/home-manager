{ pkgs, ... }: {
  home.packages = [ pkgs.waybar ];

  home.file.".config/waybar/waybar.sh".source = waybar/waybar.sh;
  home.file.".config/waybar/waybar.sh".executable = true;

  home.file.".config/waybar/powerprofile.sh".source = waybar/powerprofile.sh;
  home.file.".config/waybar/powerprofile.sh".executable = true;

  home.file.".config/waybar/mediaplayer.sh".source = waybar/mediaplayer.sh;
  home.file.".config/waybar/mediaplayer.sh".executable = true;

  home.file.".config/waybar/toggle_wvkbd.sh".source = waybar/toggle_wvkbd.sh;
  home.file.".config/waybar/toggle_wvkbd.sh".executable = true;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "custom/spotify"
          "custom/wvkbd"
          "pulseaudio"
          "group/group-hardware"
          "network"
          "bluetooth"
          "battery"
          "clock"
          "group/group-power"
        ];
        "hyprland/window" = {
          format = "{}";
          rewrite = {
            "(.*) - nvim" = "  [$1]";
            "(.*) - fish" = "   [$1]";
            "(.*) - bash" = "   [$1]";
            "(.*) - zsh" = "   [$1]";
          };
          separate-outputs = true;
        };
        "group/group-power" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 250;
            children-class = "not-power";
            transition-left-to-right = false;
            start-expanded = false;
          };
          modules = [
            "custom/power"
            "custom/quit"
            "custom/lock"
            "custom/reboot"
          ];
        };

        "custom/wvkbd" = {
          format = "⌨ ";
          on-click = "$HOME/.config/waybar/toggle_wvkbd.sh";
          tooltip = false;
        };

        "custom/quit" = {
          format = "󰗼 ";
          tooltip = false;
          on-click = "hyprctl dispatch exit";
        };
        "custom/lock" = {
          format = "󰍁 ";
          tooltip = false;
          on-click = "hyprlock";
        };
        "custom/reboot" = {
          format = "󰜉 ";
          tooltip = false;
          on-click = "reboot";
        };
        "custom/power" = {
          format = " ";
          tooltip = false;
          on-click = "shutdown now";
        };
        "group/group-hardware" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 250;
            transition-left-to-right = false;
            children-class = "not-hardware";
          };
          modules = [
            "custom/powerprofile"
            "cpu"
            "memory"
          ];
        };
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}   {name}";
          format-icons = {
            Browser = "";
            Terminal = "";
            Spotify = "";
            urgent = "";
            default = "";
            active = "󱓻 ";
          };
        };
        clock = {
          format-alt = "{:%d-%m-%Y %H:%M}";
        };
        cpu = {
          format = "{usage}% ";
        };
        memory = {
          format = "{}%  ";
        };
        battery = {
          bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
          on-click = "$TERMINAL -e nmtui";
        };
        bluetooth = {
          format = "";
          format-disabled = "2";
          format-connected = "";
          tooltip-format = "Devices connected: {num_connections}";
          on-click = "blueberry";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
        "custom/powerprofile" = {
          exec = "$HOME/.config/waybar/powerprofile.sh status";
          max-length = 40;
          interval = 30;
          return-type = "json";
          format = "{icon}";
          on-click = "$HOME/.config/waybar/powerprofile.sh toggle";
          format-icons = {
            performance = " ";
            balanced = " ";
            power-saver = " ";
          };
        };
        "custom/spotify" = {
          format = "   {}";
          max-length = 40;
          interval = 30;
          exec = "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null";
          exec-if = "pgrep spotify";
          on-click = "hyprctl dispatch \"hl.dsp.focus({window='class:spotify'})\"";
        };
      };
    };
    style = ''
      @define-color foreground #abb2bf;
      @define-color background #21252b;
      @define-color urgent #ff5555;

      * {
          background-color: @background;
          color: @foreground;

          border: none;
          border-radius: 0;
          min-height: 0;
          font-family: FiraCode Nerd Font, sans-serif;
          font-size: 12px;
      }

      .modules-left {
          margin-left: 8px;
      }

      .modules-right {
          margin-right: 8px;
      }

      #workspaces button.urgent label {
          color: @urgent;
      }

      #workspaces button {
          all: initial;
          padding: 0 6px;
          margin: 0 1.5px;
          min-width: 9px;
      }

      #workspaces button.empty {
          opacity: 0.5;
      }

      #tray,
      #cpu,
      #battery,
      #network,
      #bluetooth,
      #pulseaudio {
          min-width: 12px;
          margin: 0 7.5px;
      }

      tooltip {
          padding: 2px;
      }

      #clock {
          margin-left: 8.75px;
      }

      .hidden {
          opacity: 0;
      }

      #group-hardware {
          margin: 0 7.5px;
      }

      #not-hardware {
          margin: 0 7.5px;
      }

      #group-power{
          margin-left: 15px;
      }
    '';
  };
}
