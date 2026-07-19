{ ... }: {
  imports = [
    ../modules/base.nix
    ../modules/bitwarden.nix
    ../modules/browser.nix
    ../modules/btop.nix
    ../modules/discord.nix
    ../modules/eduroam.nix
    ../modules/fish.nix
    ../modules/fzf.nix
    ../modules/git.nix
    ../modules/hyprland.nix
    ../modules/k9s.nix
    ../modules/misc-configs.nix
    ../modules/nix.nix
    ../modules/neovim.nix
    ../modules/noctalia.nix
    ../modules/opencode
    ../modules/packages-cli.nix
    ../modules/packages-gui.nix
    ../modules/pi
    ../modules/obsidian.nix
    ../modules/scripts.nix
    ../modules/services.nix
    ../modules/starship.nix
    ../modules/stylix.nix
    ../modules/tmux.nix
    ../modules/usb.nix
    ../modules/vscode.nix
  ];

  wayland.windowManager.hyprland.settings.monitor = {
    output = "";
    mode = "preferred";
    position = "auto";
    scale = 2;
  };

  programs.nh = {
    enable = true;
    # Sets the directory path for the FLAKE environment variable
    homeFlake = "/home/ntreml/code/home-manager#homeConfigurations.laptop";
  };
  programs.pi-coding-agent.settings.defaultModel = "deepseek/deepseek-v4-pro";
  programs.pi-coding-agent.settings.defaultProvider = "openrouter";
}
