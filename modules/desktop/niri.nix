{ pkgs, ... }:
{
  # Habilita niri como sesión disponible en el login (GDM la detecta sola).
  # Esto también configura xdg-desktop-portal y drivers gráficos necesarios.
  programs.niri.enable = true;

  # xwayland-satellite: deja correr apps X11 dentro de niri (Wayland puro).
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
