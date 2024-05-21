{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    mkSystem = name: system:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = inputs // {inherit system;};
        modules = [
          ./hosts/${name}/configuration.nix
        ];
      };
  in {
    nixosConfigurations = {
      desktop = mkSystem "desktop" "x86_64-linux";
    };
  };
}
