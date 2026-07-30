{ pkgs, ... }:
{
  fonts.enableDefaultPackages = false;

  fonts.packages = with pkgs; [
    noto-fonts-color-emoji   # renombrado en unstable (antes noto-fonts-emoji)
    liberation_ttf
    jetbrains-mono
    noto-fonts-cjk-sans
  ];

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Liberation Sans" ];
    serif = [ "Liberation Serif" ];
    monospace = [ "JetBrainsMono Nerd Font" "Liberation Mono" ];
  };
}
