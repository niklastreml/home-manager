{ config, lib, ... }:

lib.mkIf config.my.isDesktop {
  services.clipse = {
    enable = true;
  };
}
