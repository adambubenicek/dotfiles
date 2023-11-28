#!/bin/sh

if ! command -v yay; then
	sudo pacman -S --noconfirm base-devel git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
fi

yay -S --noconfirm \
	brigtnessctl \
	firefox \
	foot \
	fuzzel \
	helix \
	hyprland \
	hyprpaper \
	keyd \
	lazygit \
	mako \
	mpv \
	noto-fonts \
	openssh \
	polkit-kde-agent \
	qt5-wayland \
	qt6-wayland \
	qutebrowser \
	rclone \
	swayidle \
	swaylock \
	syncthing \
	ttf-iosevka-nerd \
	unzip \
	waybar \
	xdg-desktop-portal-hyprland \
	xdg-desktop-portal-kde \
	zip \
	zsh
