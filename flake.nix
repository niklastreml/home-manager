{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

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
      nixpkgs-unstable,
      home-manager,
      nixvim,
      stylix,
      ...
    }:
    let
      pkgsLinux = import nixpkgs { system = "x86_64-linux"; };
      pkgsDarwin = import nixpkgs { system = "aarch64-darwin"; };

      pkgsUnstableLinux = import nixpkgs-unstable { system = "x86_64-linux"; };
      pkgsUnstableDarwin = import nixpkgs-unstable { system = "aarch64-darwin"; };
    in
    {
      homeConfigurations = {
        vm = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = {
            inherit nixvim;
            pkgs-unstable = pkgsUnstableLinux;
          };
          modules = [
            stylix.homeModules.stylix
            ./hosts/vm.nix
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = {
            inherit nixvim;
            pkgs-unstable = pkgsUnstableLinux;
          };
          modules = [
            stylix.homeModules.stylix
            ./hosts/laptop.nix
          ];
        };
        wsl = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = {
            inherit nixvim;
            pkgs-unstable = pkgsUnstableLinux;
          };
          modules = [
            stylix.homeModules.stylix
            ./hosts/wsl.nix
          ];
        };
        macbook = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsDarwin;
          extraSpecialArgs = {
            inherit nixvim;
            pkgs-unstable = pkgsUnstableDarwin;
          };
          modules = [
            stylix.homeModules.stylix
            ./hosts/macbook.nix
          ];
        };
      };
    };
}
