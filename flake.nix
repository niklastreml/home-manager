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
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      pkgsLinux = import nixpkgs { system = "x86_64-linux"; };
      pkgsDarwin = import nixpkgs { system = "aarch64-darwin"; };
    in
    {
      homeConfigurations = {
        vm = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = { inherit nixvim; };
          modules = [
            stylix.homeModules.stylix
            ./hosts/vm.nix
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = { inherit nixvim; };
          modules = [
            stylix.homeModules.stylix
            ./hosts/laptop.nix
          ];
        };
        wsl = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = { inherit nixvim; };
          modules = [
            stylix.homeModules.stylix
            ./hosts/wsl.nix
          ];
        };
        macbook = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsDarwin;
          extraSpecialArgs = { inherit nixvim; };
          modules = [
            stylix.homeModules.stylix
            ./hosts/macbook.nix
          ];
        };
      };
    };
}
