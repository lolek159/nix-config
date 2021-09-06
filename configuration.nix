{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/boot.nix
    ./modules/system/connectivity.nix
    ./modules/system/environment.nix
    ./modules/user/config.nix
  ];

  system.stateVersion = "21.05"; # System version.
  system.autoUpgrade.enable = true; # Enable auto system upgrade.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.gc.automatic = true; # Automatically collect garbage.
  nix.gc.dates = "18:00"; # When to collect garbage.
}