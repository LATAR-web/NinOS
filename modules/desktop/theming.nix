{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bibata-cursors
    adw-gtk3
    nwg-look
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    papirus-icon-theme
    tela-icon-theme
    hicolor-icon-theme
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    XCURSOR_SIZE = "20";

    # Fuerza a las apps de Electron (Discord, VSCode, Obsidian) a
    # correr en Wayland nativo en vez de caer a XWayland. Esto es
    # justo la causa típica de que el screen share se corte rápido:
    # capturado vía X11 en vez de directo por el portal de Wayland.
    NIXOS_OZONE_WL = "1";
  };
}
