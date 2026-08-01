{ pkgs, ... }:
{
  home.username = "ltar";
  home.homeDirectory = "/home/ltar";
  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
    userName = "ltar";
    userEmail = "rafaelbautista0611@gmail.com";
  };

  # A partir de acá vamos a ir migrando cosas puntuales, de a una.
}
