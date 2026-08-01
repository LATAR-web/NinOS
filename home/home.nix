{ pkgs, ... }:
{
  home.username = "ltar";
  home.homeDirectory = "/home/ltar";

  # No tocar sin revisar el manual de home-manager al actualizar de release.
  home.stateVersion = "26.05";

  # A partir de acá vamos a ir migrando cosas puntuales, de a una.
}
