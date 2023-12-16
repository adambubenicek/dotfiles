#!/bin/sh

sudo dnf remove -y firefox

sudo dnf install -y \
	brightnessctl \
	i3status \
	foot \
	fuzzel \
	neovim \
	mako \
	man-db \
	pamixer \
	rclone \
	sway \
	swaybg \
	syncthing \
	xdg-desktop-portal-wlr \
	zsh

flatpak install --noninteractive flathub org.mozilla.firefox
flatpak install --noninteractive flathub io.github.celluloid_player.Celluloid

systemctl enable --user --now gpg-agent.socket
systemctl enable --user --now gpg-agent-ssh.socket
