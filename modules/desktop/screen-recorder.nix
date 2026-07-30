{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gpu-screen-recorder   # backend de grabación con aceleración GPU
  ];
  # Los portales xdg-desktop-portal-gnome/gtk ya están cubiertos porque
  # GNOME sigue instalado en el sistema (ver módulo desktop/gnome.nix).
}
