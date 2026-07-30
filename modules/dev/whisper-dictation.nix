{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    whisper-cpp
    wl-clipboard
    sox
    wtype
  ];
}

