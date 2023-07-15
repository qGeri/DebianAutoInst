#!/bin/bash
##################################################################################################################################################
echo 'Add repositories!'
sed -i '1,$d' /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
echo 'deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware' | tee -a /etc/apt/sources.list
apt update -y
apt upgrade -y
##################################################################################################################################################
apt install -y wget
##################################################################################################################################################
echo 'Install Desktop Environment!'
apt install -y xfce4-session
apt install -y dbus-user-session light-locker 
apt install -y thunar thunar-archive-plugin thunar-font-manager thunar-media-tags-plugin thunar-volman xfce4-goodies xfce4-terminal
