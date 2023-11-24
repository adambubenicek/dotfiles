#!/bin/sh

if ! command -v yay; then
	sudo pacman -S --noconfirm base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si --noconfirm
	cd ..
	rm -rf yay
fi

yay -S --noconfirm keyd openssh swaylock swayidle foot fuzzel helix firefox lazygit keepassxc qutebrowser hyprland \
	xdg-desktop-portal-hyprland xdg-desktop-portal-kde zip unzip zsh polkit-kde-agent mako waybar qt6-wayland qt5-wayland \
	hyprpaper ttf-iosevka-nerd gocryptfs brigtnessctl

chsh -s /bin/zsh

sudo mkdir -p /etc/keyd
sudo tee /etc/keyd/default.conf <<EOF
[ids]
*

[main]
capslock = esc
space = overloadt2(nav, space, 200)

a = overloadt2(meta, a, 200)
s = overloadt2(alt, s, 200)
d = overloadt2(control, d, 200)
f = overloadt2(shift, f, 200)

j = overloadt2(shift, j, 200)
k = overloadt2(control, k, 200)
l = overloadt2(alt, l, 200)
; = overloadt2(meta, ;, 200)

[nav]
h = left
j = down
k = up
l = right
EOF

sudo systemctl enable --now keyd

systemctl enable --now --user ssh-agent

