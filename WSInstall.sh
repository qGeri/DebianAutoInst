#!/bin/bash
#echo 'Creating Swapfile!'
#fallocate -l 4G /swapfile
#chmod 600 swapfile
#mkswap swapfile
#swapon swapfile
#echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
#echo 'Swapfile created!'
echo 'Add repositories!'
apt install -y wget
echo 'deb http://deb.debian.org/debian bookworm-backports main contrib non-free' | sudo tee -a /etc/apt/sources.list
#mono
apt install -y apt-transport-https dirmngr gnupg ca-certificates
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
#dotnet
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
#vsCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
#Unity
sudo sh -c 'echo "deb https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
wget -qO - https://hub.unity3d.com/linux/keys/public | sudo apt-key add -
echo 'Install packages!'
apt update -y
apt upgrade -y
apt install -y gnome-session gnome-calculator gnome-system-monitor gnome-terminal planner file-roller gnome-calendar gnome-clocks gnome-disk-utility gnome-tweaks synaptic gedit gdebi nautilus nautilus-admin nautilus-data eog gcolor3 gedit-plugins gnome-passwordsafe gnome-font-viewer
apt install -y gnome-shell-extensions gnome-shell-extension-top-icons-plus gnome-shell-extension-appindicator gnome-shell-extension-bluetooth-quick-connect gnome-shell-extension-dashtodock gnome-shell-extension-desktop-icons-ng gnome-shell-extension-gpaste gnome-shell-extension-freon gnome-shell-extension-tiling-assistant lm-sensors
apt install -y firefox-esr thunderbird g3dviewer gimp gimp-data-extras inkscape krita blender mono-complete dotnet-sdk-7.0 codium unityhub vlc libreoffice gufw clamtk clamtk-gnome dconf-editor
apt install -y mesa-utils mesa-utils-extra mesa-vulkan-drivers mesa-vdpau-drivers mesa-va-drivers vulkan-tools vulkan-validationlayers vkd3d-compiler vkbasalt primus-vk radeontop
apt update -y
apt upgrade -y
echo 'Configure!'
