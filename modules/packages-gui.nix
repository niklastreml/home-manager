{ pkgs, ... }: {
  home.packages = with pkgs; [
    wl-clipboard
    brave
    ghostty
    hyprlock
    hyprpaper
    hyprpicker
    nerd-fonts.fira-code
    obsidian
    seer
    spotify
    vscode
    walker
    waybar
  ];
}
