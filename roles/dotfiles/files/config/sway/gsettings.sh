#!/bin/sh

config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
if [ ! -f "$config" ]; then exit 1; fi

gnome_schema="org.gnome.desktop.interface"

cursor_size="$(grep 'gtk-cursor-theme-size' "$config" | cut -d'=' -f2)"
cursor_blink="$(grep 'gtk-cursor-blink' "$config" | cut -d'=' -f2)"
cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | cut -d'=' -f2)"
enable_animations="$(grep 'gtk-enable-animations' "$config" | cut -d'=' -f2)"
font_name="$(grep 'gtk-font-name' "$config" | cut -d'=' -f2)"
gtk_theme="$(grep 'gtk-theme-name' "$config" | cut -d'=' -f2)"
icon_theme="$(grep 'gtk-icon-theme-name' "$config" | cut -d'=' -f2)"
overlay_scrolling="$(grep 'gtk-overlay-scrolling' "$config" | cut -d'=' -f2)"

gsettings set "$gnome_schema" cursor-size "$cursor_size"
gsettings set "$gnome_schema" cursor-blink "$cursor_blink"
gsettings set "$gnome_schema" cursor-theme "$cursor_theme"
gsettings set "$gnome_schema" enable-animations "$enable_animations"
gsettings set "$gnome_schema" font-name "$font_name"
gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
gsettings set "$gnome_schema" icon-theme "$icon_theme"
gsettings set "$gnome_schema" overlay-scrolling "$overlay_scrolling"
