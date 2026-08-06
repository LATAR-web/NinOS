{ pkgs, ... }:
{
  home.username = "ltar";
  home.homeDirectory = "/home/ltar";
  home.stateVersion = "26.05";
  programs.git = {
    enable = true;
    settings."safe" = { directory = [ "/etc/nixos" ]; };
    settings.user = {
      name = "ltar";
      email = "rafaelbautista0611@gmail.com";
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  home.packages = with pkgs; [
    vscode
    obsidian
    alacritty
    localsend
    onlyoffice-desktopeditors
    proton-vpn
    htop
    yazi
    playerctl
    fastfetch
    vesktop
    papirus-folders
    cliamp
    pywalfox-native
  ];
  # Hook de Noctalia: sincroniza modo claro/oscuro con GNOME/GTK4.
  # No migramos config.toml de Noctalia porque la propia app lo reescribe
  # desde su UI — si lo manejara home-manager (symlink a /nix/store,
  # inmutable), Noctalia no podría guardar cambios. Solo el script del
  # hook, que es estático, se gestiona acá.
  home.file.".config/noctalia/hooks/sync-gnome-colorscheme.sh" = {
    source = ./files/sync-gnome-colorscheme.sh;
    executable = true;
  };
  # Config de niri: binds, workspaces, mirror y autostart de Noctalia.
  # Versionada acá para que nunca más se pierda en una reinstalación.
  home.file.".config/niri/config.kdl" = {
    source = ./files/niri/config.kdl;
    force = true;
  };
  # Overrides de Flatpak para theming — se reaplican en cada switch,
  # así no dependemos de un backup de texto que hay que releer a mano.
  home.activation.flatpakThemeOverrides = ''
    ${pkgs.flatpak}/bin/flatpak override --user --filesystem=xdg-data/themes:ro || true
    ${pkgs.flatpak}/bin/flatpak override --user --env=GTK_THEME=adw-gtk3-dark || true
    ${pkgs.flatpak}/bin/flatpak override --user --filesystem=xdg-config/qt6ct:ro || true
    ${pkgs.flatpak}/bin/flatpak override --user --env=QT_QPA_PLATFORMTHEME=kde || true
  '';
}
