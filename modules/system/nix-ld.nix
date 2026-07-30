{ pkgs, ... }:
{
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    curl
    icu
    libGL
    glib
    fuse3
    libxml2
    nss
    nspr
    dbus
    expat

   
  ];
}
