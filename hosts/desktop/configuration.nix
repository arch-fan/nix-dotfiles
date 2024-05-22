# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  nixpkgs,
  system,
  home-manager,
  ...
}: let
  pkgs = import nixpkgs {
    inherit system;
  };
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./drivers/video.nix
    ./drivers/sound.nix

    ./services/docker.nix

    ./settings/locales.nix
    ./settings/network.nix
    ./settings/printing.nix
    ./settings/time.nix

    ./system/boot.nix

    ./display/hyprland.nix

    home-manager.nixosModules.default
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  home-manager.users.juan = import ./home.nix;

  users.users.juan = {
    isNormalUser = true;
    description = "Juan";
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

  system.stateVersion = "23.11";
}
