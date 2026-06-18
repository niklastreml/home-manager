{ lib, pkgs, ... }: let
    username = "ntreml";
in
{
    home = {
        packages = with pkgs; [
            autojump
            bat
            bear
            # blueberry
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
            git
            git-lfs
            gnumake
            graphviz
            helmfile
            inetutils #
            k9s
            kind
            krew
            kubectl
            opencode
            ripgrep
            tmux
            tree-sitter
            typst
            unzip
            vim
            wget
            wl-clipboard #

            # GUI
            brave
            ghostty
            hyprlock
            hyprpaper
            hyprpicker
            obsidian
            seer
            spotify
            vscode
            walker
            waybar
        ];

        username = "ntreml";
        homeDirectory = "/home/ntreml";
        # never change this ever
        stateVersion = "26.05";
        shell = {
            enableFishIntegration = true;
        };
    };

    services = {
        clipse = {
            enable = true;
        };
    };

    programs = {
        fish = {
            enable = true;
            # interactiveShellInit = ''
            # fenv source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
            # '';
            plugins = with pkgs.fishPlugins; [
            {
                name = "fzf-fish";
                src = fzf-fish.src;
            }
            {
                name = "async-prompt";
                src = async-prompt.src;
            }
            {
                name = "foreign-env";
                src = foreign-env.src;
            }
            {
                name = "plugin-git";
                src = plugin-git.src;
            }
            {
                name = "kubectl-aliases";
                src = pkgs.fetchFromGitHub {
                    owner = "ahmetb";
                    repo = "kubectl-aliases";
                    rev = "7549fa45bbde7499b927c74cae13bfb9169c9497";
                    sha256 = "sha256-NkprSk55aRVHiq9JXduQl6AGZv5pBLHznRToOdm9OUw=";
                };
            }
            {
                name = "onedark-fish";
                src = pkgs.fetchFromGitHub {
                    owner = "woheedev";
                    repo = "onedark-fish";
                    rev = "f81319c27dadc72e3f9055ad42b28d2612aaa83b";
                    sha256 = "sha256-+hvSMctZktyzv4ZJbseFFA42Bfsbsa8eVV1YfgKckxI=";
                };
            }
            ];
        };
        neovim = {
            enable = false;
        };
        starship = {
            enable = true;
            enableFishIntegration = true;
            enableInteractive = false;
            presets = [ "nerd-font-symbols" ];
        };
    };
}
