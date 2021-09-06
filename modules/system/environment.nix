{ config, lib, pkgs, ... }:

{
  # Package configuration
  nixpkgs.config = import ../pkgs/config.nix;

  # Default services
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      layout = "us,si";
      xkbOptions = "caps:escape,grp:switch";
    };
  };

  qt5 = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Keychain
  services.gnome.gnome-keyring.enable = true;
  # security.pam.services.kwallet = {
  #   name = "kwallet";
  #   enableKwallet = true;
  # };

  # Localizaiton
  i18n.defaultLocale = "en_GB.UTF-8";
  time.timeZone = "Europe/Ljubljana";

  # Docker
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    grc
    xclip
    wget
    dconf2nix
  ];
}	