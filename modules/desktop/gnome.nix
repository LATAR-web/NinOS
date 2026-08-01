{ pkgs, config, lib, ... }:
let
  gnomeSessionWrapper = pkgs.writeShellScript "gnome-session-wrapped" ''
    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=gnome
    export XDG_CURRENT_DESKTOP=GNOME
    exec ${pkgs.gnome-session}/bin/gnome-session "$@"
  '';
  gnomeDesktopEntry = pkgs.writeTextDir "share/wayland-sessions/gnome.desktop" ''
    [Desktop Entry]
    Name=GNOME
    Comment=This session logs you into GNOME
    Exec=${gnomeSessionWrapper}
    Type=Application
    DesktopNames=GNOME
  '';
in
{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  programs.firefox.enable = true;

  # noctalia-greeter no registra XDG_SESSION_TYPE=wayland antes de lanzar
  # gnome-session (algo que GDM sí hace normalmente), así que mutter falla
  # con "Failed to find any matching session". Reemplazamos el .desktop de
  # GNOME por uno que exporta esas variables antes de arrancar la sesión.
  # lib.hiPrio asegura que este archivo gane sobre el gnome.desktop de stock.
  environment.systemPackages = config.services.displayManager.sessionPackages ++ [
    (lib.hiPrio gnomeDesktopEntry)
  ];
}
