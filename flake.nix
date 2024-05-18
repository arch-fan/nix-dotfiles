{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let 
      mkConfig = hostName: system: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        
        modules = [
          ./hosts/${hostName}
        ];
      };
    in {
    homeConfigurations = {
      wsl = mkConfig "wsl" "x86_64-linux";
    };
  };
}
