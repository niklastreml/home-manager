{ config, lib, pkgs, ... }:

lib.mkIf config.my.isDesktop {
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
