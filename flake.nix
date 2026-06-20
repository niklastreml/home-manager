{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:nix-community/stylix/release-26.05";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      stylix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations = {
        vm = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nixvim; };
          modules = [
            stylix.homeModules.stylix
            ./hosts/vm.nix
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nixvim; };
          modules = [
            stylix.homeModules.stylix
            ./hosts/laptop.nix
          ];
        };
        wsl = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nixvim; };
          modules = [
            stylix.homeModules.stylix
            ./hosts/wsl.nix
          ];
        };
      };
    };
}
