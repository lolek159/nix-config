{ pkgs, config, ... }: 

let
  package = file: import (../packages + ("/" + file)) { inherit pkgs; };
  default = package "default.nix";
  android = package "android.nix";
  java    = package "java.nix";
  docker  = package "docker.nix";
in

{
  imports = [ ./shared.nix ];

  home.packages =
    default ++
    android ++
    java ++
    docker;
}