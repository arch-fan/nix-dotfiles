{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      pkgs = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkHomeConfig = hostName: system: home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs system;
        
        modules = [
          ./hosts/${hostName}
        ];
      };
    in {
    homeConfigurations = {
      wsl = mkHomeConfig "wsl" "x86_64-linux";
    };
  };
}
