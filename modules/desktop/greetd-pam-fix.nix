{ ... }:
{
  # greetd no registra XDG_SESSION_TYPE ante logind al abrir la sesión PAM,
  # así que mutter (GNOME) no encuentra su sesión ("Failed to find any
  # matching session"). Forzamos el tipo aquí, a nivel de PAM, que es el
  # único punto donde logind realmente lee este dato.
  security.pam.services.greetd.rules.session.systemd.args = [ "type=wayland" ];
}
