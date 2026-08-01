{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./hosts/nixos/hardware-configuration.nix

    # ---- Sistema base ----
    ./modules/system/boot.nix
    ./modules/system/locale.nix
    ./modules/system/nix-ld.nix
    ./modules/system/virtualisation.nix
    ./modules/system/maintenance.nix
    ./modules/system/overlays.nix
    ./modules/system/flatpak-repo.nix
    ./modules/system/bluetooth.nix

    # ---- Hardware ----
    ./modules/hardware/graphics.nix
    ./modules/hardware/cuda.nix

    # ---- Escritorio ----
    ./modules/desktop/portals.nix
    ./modules/desktop/audio-production.nix
    ./modules/desktop/gnome.nix
    ./modules/desktop/gnome-cleanup.nix
    ./modules/desktop/greetd-pam-fix.nix
    ./modules/desktop/fonts.nix
    ./modules/desktop/niri.nix
    ./modules/desktop/noctalia.nix
    ./modules/desktop/greeter.nix
    ./modules/desktop/theming.nix
    ./modules/desktop/firefox-theming.nix
    ./modules/desktop/screen-recorder.nix

    # ---- Servicios ----
    ./modules/services/syncthing.nix
    ./modules/network/localsend.nix

    # ---- Desarrollo / IA ----
    ./modules/dev/python-ai.nix
    ./modules/dev/kubernetes.nix
    ./modules/gaming/steam.nix
    ./modules/dev/tools.nix
./modules/dev/whisper-dictation.nix




    # ---- Apps de usuario ----
    ./modules/apps.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users."ltar" = {
    isNormalUser = true;
    description = "LTAR";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" "docker" "input" ];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
