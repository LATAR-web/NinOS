{ ... }:
{
  # ======================================================
  # LocalSend — puerto de descubrimiento y transferencia
  # ======================================================
  # LocalSend usa el puerto 53317 (TCP para transferencia,
  # UDP para el descubrimiento por multicast en la red local).
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
}
