{ config, lib, pkgs, ... }:

lib.mkIf config.my.isDesktop {
  programs.waybar = {
    enable = false;
  };
}
