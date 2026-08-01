{ pkgs, lib, config, ... }:
lib.mkIf config.myProfiles.whisperDictation {
  environment.systemPackages = with pkgs; [
    whisper-cpp
    wl-clipboard
    sox
    wtype
  ];
}
