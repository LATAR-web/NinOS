{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # --- Utilidades básicas ---
    wget
    git
    vscode
    obsidian
    alacritty
    localsend
    onlyoffice-desktopeditors
    proton-vpn     
    htop
    yazi
    
    
    #Musica
    easyeffects
    playerctl

    # --- Terminal ---
    fastfetch
    # --- Paquetes de iconos TUI ---
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.droid-sans-mono
    # --- Vesktop: cliente de Discord con Vencord preinstalado y soporte
    # correcto de screenshare en Linux/Wayland (a diferencia del oficial) ---
    vesktop
    papirus-folders
    cliamp
    pywalfox-native
# modo espejo 
  wl-mirror
  jq



  ];
}
