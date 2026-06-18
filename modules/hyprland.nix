{ config, lib, pkgs, ... }:

lib.mkIf config.my.isDesktop {
  wayland.windowManager.hyprland = {
    enable = false;
  };
}
