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
            ripgrep
            tmux
            tree-sitter
            typst
            unzip
            vim
            wget
            wl-clipboard #
        ];

        username = "ntreml";
        homeDirectory = "/home/ntreml";
        # never change this ever
        stateVersion = "26.05";
        shell = {
            enableFishIntegration = true;
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
