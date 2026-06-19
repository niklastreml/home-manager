{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.one.enable = true;
    # plugins.lualine.enable = true;
  };
}
