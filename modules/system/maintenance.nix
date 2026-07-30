{ pkgs, lib, ... }:
{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.settings.auto-optimise-store = true;

  boot.loader.systemd-boot.configurationLimit = 10;

  services.fwupd.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  services.flatpak.enable = true;

  programs.zsh.enable = true;

  # Evita compilar documentación pesada (manuales HTML) que no necesitas.
  # También esquiva el bug de compilación de python3.12-doc presente en
  # este snapshot de nixos-unstable (Sphinx/docutils rotos entre sí).
  documentation.doc.enable = false;
  documentation.nixos.enable = false;
}
