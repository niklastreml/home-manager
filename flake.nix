{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/main";
    };
    stylix = {
      url = "github:nix-community/stylix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aislop = {
      url = "github:mattpocock/skills";
      flake = false;
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs =
    {
      nixpkgs,
      nur,
      home-manager,
      nixvim,
      stylix,
      aislop,
      noctalia,
      ...
    }:
    let
      pkgsLinux = import nixpkgs { system = "x86_64-linux"; };
      pkgsDarwin = import nixpkgs { system = "aarch64-darwin"; };

      nurLinux = import nur {
        pkgs = pkgsLinux;
        nurpkgs = pkgsLinux;
      };
      nurDarwin = import nur {
        pkgs = pkgsDarwin;
        nurpkgs = pkgsDarwin;
      };
    in
    {
      homeConfigurations = {
        "ntreml@vm" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = {
            aislop = aislop;
            inherit nixvim;
          };
          modules = [
            stylix.homeModules.stylix
            ./hosts/vm.nix
          ];
        };
        "ntreml@laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = {
            aislop = aislop;
            inherit nixvim;
            nur = nurLinux;
          };
          modules = [
            stylix.homeModules.stylix
            noctalia.homeModules.default
            ./hosts/laptop.nix
          ];
        };
        "ntreml@wsl" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = {
            aislop = aislop;
            inherit nixvim;
            nur = nurLinux;
          };
          modules = [
            stylix.homeModules.stylix
            ./hosts/wsl.nix
          ];
        };
        "ntreml@macbook" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsDarwin;
          extraSpecialArgs = {
            aislop = aislop;
            inherit nixvim;
            nur = nurDarwin;
          };
          modules = [
            stylix.homeModules.stylix
            ./hosts/macbook.nix
          ];
        };
      };
    };
}
