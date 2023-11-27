#!/bin/sh

if ! command -v yay; then
	sudo pacman -S --noconfirm base-devel git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
fi

yay -S --noconfirm keyd openssh swaylock swayidle foot fuzzel helix firefox lazygit keepassxc qutebrowser hyprland \
	xdg-desktop-portal-hyprland xdg-desktop-portal-kde zip unzip zsh polkit-kde-agent mako waybar qt6-wayland qt5-wayland \
	hyprpaper noto-fonts ttf-iosevka-nerd brigtnessctl syncthing rclone
