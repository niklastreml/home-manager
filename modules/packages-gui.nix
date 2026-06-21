{ pkgs, ... }: {
  home.packages = with pkgs; [
    wl-clipboard
    brave
    easyroam-connect-desktop
    ghostty
    hyprlock
    hyprpaper
    hyprpicker
    hyprpolkitagent
    imagemagick
    nautilus
    nerd-fonts.fira-code
    playerctl
    brightnessctl
    seer
    spotify
    walker
    xournalpp
  ];
}
