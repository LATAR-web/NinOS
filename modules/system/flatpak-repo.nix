{ pkgs, lib, config, ... }:
{
  # Registra el repositorio Flathub automáticamente al reconstruir.
  # Espera a que la red esté lista antes de intentar contactar Flathub,
  # y solo corre una vez de verdad (RemainAfterExit) en vez de fallar
  # en cada arranque intentando re-agregar un remote que ya existe.
  systemd.services.flatpak-add-flathub-repo = {
    wantedBy = [ "multi-user.target" ];
    after = [ "flatpak-system-helper.service" "network-online.target" ];
    wants = [ "network-online.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
  };
}
