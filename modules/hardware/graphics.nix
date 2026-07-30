{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver   # VAAPI (iHD) para Intel Iris Xe / Tiger Lake en adelante
    ];
  };
  services.xserver.videoDrivers = [ "modesetting" ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
  # (Se quitó la regla de udev que reiniciaba gnome-shell.target en cada
  # cambio de DRM — causaba fallos porque se disparaba también fuera de
  # sesiones de GNOME, y sin contexto de usuario. GNOME/Mutter y Niri ya
  # manejan el hotplug de monitores por su cuenta.)

boot.kernelParams = [
    "i915.enable_psr=0"
    "i915.enable_dc=0"
  ];

}
