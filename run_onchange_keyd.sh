#!/bin/sh

sudo mkdir -p /etc/keyd
sudo tee /etc/keyd/default.conf <<EOF
[ids]
*

[main]
capslock = esc
space = overloadt2(nav, space, 200)

[nav]
h = left
j = down
k = up
l = right

n = home
m = pagedown
, = pageup
. = end

a = oneshot(meta)
s = oneshot(alt)
d = oneshot(control)
f = oneshot(shift)
EOF

sudo systemctl enable --now keyd
