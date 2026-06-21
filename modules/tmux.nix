{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.tmux ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    focusEvents = true;
    terminal = "screen-256color";
    extraConfig = ''
      set -g allow-passthrough on
      set -g visual-activity off
    '';

  };
}
