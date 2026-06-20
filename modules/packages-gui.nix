{ pkgs, ... }: {
  home.packages = with pkgs; [
    wl-clipboard
    brave
    ghostty
    hyprlock
    hyprpaper
    hyprpicker
    hyprpolkitagent
    nautilus
    nerd-fonts.fira-code
    playerctl
    brightnessctl
    obsidian
    seer
    spotify
    vscode
    walker
    waybar
    xournalpp
  ];
}
