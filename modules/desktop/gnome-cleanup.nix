{ pkgs, lib, ... }:
{
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-maps
    gnome-weather
    gnome-connections
    epiphany
    gnome-contacts
    gnome-music
    gnome-characters
    totem
    simple-scan
    yelp
    geary
    gnome-software
  ];

  services.packagekit.enable = lib.mkForce false;

  # xterm viene incluido por defecto al activar services.xserver.enable,
  # como terminal de emergencia/respaldo. No lo necesitas (usas alacritty).
  services.xserver.excludePackages = [ pkgs.xterm ];
}
