{ nixvim, ... }: {
  imports = [
    nixvim.homeModules.nixvim
    ./nix-your-shell.nix
  ];
  home.username = "ntreml";

  home.homeDirectory = "/home/ntreml";
  home.stateVersion = "26.05";
  home.shell.enableFishIntegration = true;
  nixpkgs.config.allowUnfree = true;
}
