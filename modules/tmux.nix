{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    focusEvents = true;
    terminal = "screen-256color";
  };
}
