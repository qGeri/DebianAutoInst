#!/bin/bash
##################################################################################################################################################
echo 'Add repositories!'
apt install -y wget
sed -i '1,$d' /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
echo 'deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
apt update -y
apt upgrade -y
#####################################################################################################################################################
apt install -y gnome-session gnome-terminal 
apt install -y gnome-shell-extension-arc-menu gnome-shell-extension-bluetooth-quick-connect gnome-shell-extension-dash-to-panel gnome-shell-extension-desktop-icons-ng gnome-shell-extension-tiling-assistant gnome-shell-extension-appindicator
