#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1280x1024x16 &
openbox-session&
x11vnc -display :1 -bg -nopw -listen localhost -xkb -ncache 10 -ncache_cr -rfbauth /root/.vnc/passwd
cd /root/noVNC && ./utils/launch.sh --vnc localhost:5900
