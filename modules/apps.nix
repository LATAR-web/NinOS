{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget

    # --- Paquetes de iconos TUI ---
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.droid-sans-mono

    # modo espejo (dependencias del keybind de niri)
    wl-mirror
    jq
  ];
}
