{ lib, pkgs, isWsl ? false, ... }:
let
  platformModule = { lib, config, ... }: {
    options.my = {
      isLinux = lib.mkOption {
        type = lib.types.bool;
        default = pkgs.stdenv.isLinux;
        readOnly = true;
      };
      isDarwin = lib.mkOption {
        type = lib.types.bool;
        default = pkgs.stdenv.isDarwin;
        readOnly = true;
      };
      isWsl = lib.mkOption {
        type = lib.types.bool;
        default = isWsl;
        readOnly = true;
      };
      isDesktop = lib.mkOption {
        type = lib.types.bool;
        default = pkgs.stdenv.isLinux && !isWsl;
        readOnly = true;
      };
    };
  };
in {
  imports = [
    platformModule
    ./modules/services.nix
    ./modules/packages-cli.nix
    ./modules/packages-gui.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/tmux.nix
    ./modules/starship.nix
    ./modules/neovim.nix
    ./modules/nix.nix
    ./modules/fzf.nix
    ./modules/bitwarden.nix
    ./modules/btop.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/aerospace.nix
    ./modules/scripts.nix
    ./modules/misc-configs.nix
  ];

  home = {
    username = "ntreml";
    homeDirectory = "/home/ntreml";
    stateVersion = "26.05";
    shell = {
      enableFishIntegration = true;
    };
  };
}
