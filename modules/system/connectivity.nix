{ config, lib, pkgs, ... }:
{
  # Networking
  networking.hostName = "ziga-thinkpad";
  networking.networkmanager.enable = true;
  
  # Bluetooth
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
}