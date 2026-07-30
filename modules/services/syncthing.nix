{ pkgs, ... }:
{
  # ======================================================
  # Syncthing — sincronización de archivos entre dispositivos
  # ======================================================
  services.syncthing = {
    enable = true;
    user = "ltar";
    dataDir = "/home/ltar/Sync";
    configDir = "/home/ltar/.config/syncthing";

    # Interfaz web solo en localhost por seguridad.
    # Accede desde el navegador en: http://localhost:8384
    guiAddress = "127.0.0.1:8384";

    # Abre automáticamente los puertos necesarios en el firewall
    # para descubrimiento y transferencia con otros dispositivos.
    openDefaultPorts = true;
  };
}
