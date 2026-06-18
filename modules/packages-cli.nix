{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    autojump
    bat
    bear
    bitwarden-cli
    btop
    cloc
    curl
    difftastic
    dive
    eza
    fd
    fzf
    gh
    gnumake
    graphviz
    helmfile
    inetutils
    k9s
    kind
    krew
    kubectl
    ripgrep
    tmux
    tree-sitter
    typst
    unzip
    vim
    wget
    opencode
  ];
}
