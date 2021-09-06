{ pkgs }:
with pkgs; [
  # System utils
  htop
  git
  jq
  gnome.gnome-tweaks

  # Editors
  vscode
  typora

  # Image related
  krita
  ffmpeg
  
  # Web
  google-chrome-beta
  youtube-dl

  # Chat
  discord
  skype

  # Themes
  papirus-icon-theme
]