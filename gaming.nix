{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     gzdoom
     enyo-doom
     glxinfo
  ];

  programs.steam.enable = true;
}

