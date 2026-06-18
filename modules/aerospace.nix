{ config, lib, pkgs, ... }:

lib.mkIf config.my.isDarwin {
  # home.file.".config/aerospace/aerospace.toml".source = ./aerospace.toml;
}
