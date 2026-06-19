{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        vm = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/vm.nix ];
        };
        wsl = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/wsl.nix ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/laptop.nix ];
        };
      };
    };
}
