{ config, lib, pkgs, ... }:

lib.mkIf config.my.isDesktop {
  home.file.".config/waybar/config.jsonc".source = waybar/config.jsonc;

  home.file.".config/waybar/waybar.sh".source = waybar/waybar.sh;
  home.file.".config/waybar/waybar.sh".executable = true;

  home.file.".config/waybar/powerprofile.sh".source = waybar/powerprofile.sh;
  home.file.".config/waybar/powerprofile.sh".executable = true;

  home.file.".config/waybar/mediaplayer.sh".source = waybar/mediaplayer.sh;
  home.file.".config/waybar/mediaplayer.sh".executable = true;

  programs.waybar = {
    enable = true;
    settings = {};
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
        font-family: FiraCode Nerd Font;
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
