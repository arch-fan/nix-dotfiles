{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, ... }@inputs:
    let
      mkSystem = name: system:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = inputs // { inherit system; };
          modules = [ ./hosts/${name}/configuration.nix ];
        };

      mkHome = name: system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [ ./hosts/${name}/default.nix ];
        };
    in {
      nixosConfigurations = {
        desktop = mkSystem "desktop" "x86_64-linux";
        dam = mkSystem "dam" "x86_64-linux";
        smoker = mkSystem "smoker" "x86_64-linux";
        vortex = mkSystem "vortex" "x86_64-linux";
      };

      homeConfigurations = { wsl = mkHome "wsl" "x86_64-linux"; };
    };
}
