{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    appimage-run
    libayatana-appindicator

    (pkgs.writeShellScriptBin "talktype" ''
      mkdir -p /tmp/talktype-libs
      ln -sf ${pkgs.libayatana-appindicator}/lib/libayatana-appindicator3.so.1 /tmp/talktype-libs/libappindicator3.so.1
      export LD_LIBRARY_PATH="/tmp/talktype-libs:$LD_LIBRARY_PATH"
      exec ${pkgs.appimage-run}/bin/appimage-run "$HOME/Aplicaciones/TalkType.AppImage" "$@"
    '')
  ];
}
