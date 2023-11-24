#!/bin/sh

set -e

rclone config create dropbox dropbox

sudo mv ~/.config/rclone/rclone.conf /etc/rclone.conf

sudo chown root:root /etc/rclone.conf
sudo chmod 700 /etc/rclone.conf

sudo tee /etc/systemd/system/home-$USER-dropbox.mount <<EOF
[Unit]
Description=Mount for /mnt/dropbox
[Mount]
Type=rclone
What=dropbox:
Where=/home/$USER/dropbox
Options=rw,_netdev,allow_other,args2env,vfs-cache-mode=writes,config=/etc/rclone.conf,cache-dir=/var/rclone
EOF

sudo tee /etc/systemd/system/home-$USER-dropbox.automount <<EOF
[Unit]
Description=Automount for /mnt/dropbox
[Automount]
Where=/home/$USER/dropbox
TimeoutIdleSec=60
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable --now home-$USER-dropbox.automount

sudo rclone config create vault crypt \
  remote="dropbox:vault" \
  password="$(keepassxc-cli show -sa password ~/dropbox/passwords.kdbx Vault | rclone obscure -)" \
  password2="$(keepassxc-cli show -sa password2 ~/dropbox/passwords.kdbx Vault | rclone obscure -)" \
  --config="/etc/rclone.conf" \
  --non-interactive \
  --obscure

sudo tee /etc/systemd/system/home-$USER-vault.mount <<EOF
[Unit]
Description=Mount for /mnt/dropbox
[Mount]
Type=rclone
What=vault:
Where=/home/$USER/vault
Options=rw,_netdev,allow_other,args2env,vfs-cache-mode=writes,config=/etc/rclone.conf,cache-dir=/var/rclone
EOF

sudo tee /etc/systemd/system/home-$USER-vault.automount <<EOF
[Unit]
Description=Automount for /mnt/dropbox
[Automount]
Where=/home/$USER/vault
TimeoutIdleSec=60
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable --now home-$USER-vault.automount
