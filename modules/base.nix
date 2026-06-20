{ nixvim, ... }: {
  imports = [ nixvim.homeModules.nixvim ];
  home.username = "ntreml";

  home.homeDirectory = "/home/ntreml";
  home.stateVersion = "26.05";
  home.shell.enableFishIntegration = true;
  nixpkgs.config.allowUnfree = true;
}
