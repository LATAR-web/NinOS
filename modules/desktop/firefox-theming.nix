{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pywalfox-native   # daemon que conecta el navegador con Noctalia
  ];
}
