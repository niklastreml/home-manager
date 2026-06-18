{ config, lib, pkgs, ... }:

{
  programs.fish = {
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
}
