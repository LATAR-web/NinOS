{ pkgs, ... }:
{
  # ⚠️ TODO COMENTADO A PROPÓSITO — no tienes GPU Nvidia todavía.
  # El día que tengas una tarjeta Nvidia, descomenta este bloque completo
  # y corre `nixos-rebuild switch`.

  # nixpkgs.config.cudaSupport = true;

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = false;
  #   open = false; # true si usas GPU serie 20xx en adelante y quieres driver open-source
  #   nvidiaSettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };

  # services.xserver.videoDrivers = [ "nvidia" ];

  # environment.systemPackages = with pkgs; [
  #   cudaPackages.cudatoolkit
  #   cudaPackages.cudnn
  # ];
}
