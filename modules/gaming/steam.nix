{ pkgs, ... }:
{
  # ======================================================
  # Steam + Proton — para jugar juegos de Windows en Linux
  # ======================================================
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;       # para jugar en streaming a otro dispositivo
    dedicatedServer.openFirewall = false; # actívalo solo si hosteas servidores de juegos
    localNetworkGameTransfers.openFirewall = true;
  };

  # Habilita Gamescope (útil para forzar resolución/escala en juegos específicos)
  programs.gamescope.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-qt   # gestor gráfico para instalar Proton-GE (versión mejorada de Proton)
    mangohud      # overlay de FPS/temperatura/uso de GPU dentro de los juegos
  ];
}
