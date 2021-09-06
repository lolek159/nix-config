{ config, lib, pkgs, ... }:

let
  inherit (import ../../variables.nix) mainUser;
  home-manager = import (builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz" ) { };
  defaultGroups = [ "adbuser" "wheel" "networkmanager" ];
  homeConfig = file: import (./home + ("/" + file)) { inherit config; inherit pkgs; };
in
{
  imports = [ home-manager.nixos ];

  # Font configuration
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      fira-code
      jetbrains-mono
      cascadia-code
      noto-fonts
      noto-fonts-extra
      noto-fonts-emoji
      source-code-pro
    ];
  };

  # Adb debug bridge for android connection
  programs.adb.enable = true;
  programs.fuse.userAllowOther = true;

  # Shell config
  environment.pathsToLink = [ "/share/zsh" ];
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Main user configuration
  users.users."${mainUser}" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    useDefaultShell = false;
    extraGroups = defaultGroups ++ [ "adbusers" "docker" ];
  };

  home-manager.users = {
    root        = homeConfig "main.nix";
    ${mainUser} = homeConfig "main.nix";
    # work        = homeConfig "work.nix";
  };
}
