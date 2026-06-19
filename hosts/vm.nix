{ ... }: {
    imports = [
        ../modules/base.nix
        ../modules/bitwarden.nix
        ../modules/btop.nix
        ../modules/fish.nix
        ../modules/fzf.nix
        ../modules/git.nix
        ../modules/hyprland.nix
        ../modules/misc-configs.nix
        ../modules/neovim.nix
        # ../modules/nix.nix
        ../modules/packages-cli.nix
        ../modules/packages-gui.nix
        ../modules/scripts.nix
        ../modules/services.nix
        ../modules/starship.nix
        ../modules/tmux.nix
        ../modules/waybar.nix
    ];
}
