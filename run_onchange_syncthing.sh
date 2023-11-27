#!/bin/sh

set -e

systemctl enable --now syncthing@$USER
