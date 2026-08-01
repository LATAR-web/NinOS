#!/usr/bin/env bash
if [ "$NOCTALIA_THEME_MODE" = "dark" ]; then
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
else
  gsettings set org.gnome.desktop.interface color-scheme prefer-light
fi
