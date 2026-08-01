{ pkgs, ... }:
{
  home.username = "ltar";
  home.homeDirectory = "/home/ltar";
  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
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
}
