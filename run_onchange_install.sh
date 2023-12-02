#!/bin/sh

if ! command -v yay; then
	sudo pacman -S --noconfirm base-devel git
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
fi

yay -S --noconfirm --needed \
	brightnessctl \
	firefox \
	foot \
	fuzzel \
	helix \
	hyprland \
	hyprpaper \
	keyd \
	lazygit \
	mako \
	man-db \
	mpv \
	nodejs \
	npm \
	noto-fonts \
	openssh \
	pamixer \
	polkit-kde-agent \
	qt5-wayland \
	qt6-wayland \
	qutebrowser \
	rclone \
	swayidle \
	swaylock \
	syncthing \
	firefox-tridactyl-native \
	ttf-iosevka-nerd \
	unzip \
	waybar \
	xdg-desktop-portal-hyprland \
	xdg-desktop-portal-kde \
	zip \
	zsh

sudo npm install --global \
  yarn \
  typescript \
  typescript-language-server
