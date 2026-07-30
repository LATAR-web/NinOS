{ pkgs, ... }:
{
  # Habilita libvirt con QEMU/KVM como backend
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;   # TPM virtual, útil para instalar Windows 11 en VM
      # OVMF (soporte UEFI para las VMs) ya viene incluido por defecto
      # con qemu_kvm en nixpkgs unstable, no requiere configuración extra.
    };
  };

  # Interfaz gráfica para administrar las VMs
  programs.virt-manager.enable = true;

  # Habilita spice para portapapeles compartido, redimensionar pantalla, etc.
  virtualisation.spiceUSBRedirection.enable = true;

  # Recuerda: el usuario "ltar" ya está en el grupo "libvirtd" y "kvm"
  # (lo agregamos en configuration.nix), necesario para usar virt-manager sin sudo.
}
