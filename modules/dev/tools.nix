{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gh
    lazygit
    neovim
    docker
    docker-compose
    nodejs_22
    ripgrep
    fd
    bat
    eza
    fzf
    tldr
    tree

    gcc
    gnumake
    unzip
    gzip

    # ---- LSP de Nix (mejor instalarlo por Nix, no por Mason:
    # usa la misma versión de Nix que tu sistema) ----
    nixd
  ];

  virtualisation.docker.enable = true;
  users.users."ltar".extraGroups = [ "docker" ];
}
