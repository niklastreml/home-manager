{ config, lib, pkgs, ... }:

lib.mkIf config.my.isDesktop {
  home.packages = with pkgs; [
    wl-clipboard
    brave
    ghostty
    hyprlock
    hyprpaper
    hyprpicker
    obsidian
    seer
    spotify
    vscode
    walker
    waybar
  ];
}
