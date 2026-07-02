{ ... }: {
  imports = [
    ../modules/base.nix
    ../modules/bitwarden.nix
    ../modules/btop.nix
    ../modules/fish.nix
    ../modules/fzf.nix
    ../modules/git.nix
    ../modules/k9s.nix
    ../modules/misc-configs.nix
    ../modules/neovim.nix
    ../modules/opencode
    ../modules/packages-cli.nix
    ../modules/pi
    ../modules/scripts.nix
    ../modules/starship.nix
    ../modules/stylix.nix
    ../modules/tmux.nix
  ];

  programs.pi-coding-agent.settings.defaultModel = "claude-opus-4.8";
  programs.pi-coding-agent.settings.defaultProvider = "openrouter";
  defaultProvider = "github-copilot";

}
