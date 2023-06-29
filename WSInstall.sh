#!/bin/bash
echo 'Creating Swapfile!'
fallocate -l 20G /swapfile
chmod 600 swapfile
mkswap swapfile
swapon swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
echo 'Swapfile created!'
##################################################################################################################################################
echo 'Add repositories!'
apt install -y wget
sed -i '1,$d' /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware' | sudo tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware' | sudo tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm-backports main contrib non-free non-free-firmware' | sudo tee -a /etc/apt/sources.list
echo 'deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware' | sudo tee -a /etc/apt/sources.list
##################################################################################################################################################
echo 'Add external repositories!'
##################################################################################################################################################
echo 'Add Mono repositories!'
apt install -y apt-transport-https dirmngr gnupg ca-certificates
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
###################################################################################################################################################
echo 'Add Dotnet repositories!'
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
######################################################################################################################################################
echo 'Add VSCode repositories!'
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
######################################################################################################################################################
echo 'Add Unity Engine repositories!'
sudo sh -c 'echo "deb https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
wget -qO - https://hub.unity3d.com/linux/keys/public | sudo apt-key add -
######################################################################################################################################################
#Spotify
#curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#echo 'Install packages!'
#######################################################################################################################################################
apt update -y
apt upgrade -y
apt install -y gnome-session gnome-calculator gnome-package-updater lollypop gnome-sound-recorder gnome-system-monitor gnome-terminal planner file-roller gnome-calendar gnome-clocks gnome-disk-utility gnome-tweaks synaptic gedit gdebi nautilus nautilus-admin nautilus-data eog gcolor3 gedit-plugins gnome-passwordsafe gnome-font-viewer
apt install -y firefox-esr thunderbird g3dviewer vlc libreoffice gufw clamtk clamtk-gnome dconf-editor jstest-gtk
apt install -y mesa-utils mesa-utils-extra mesa-vulkan-drivers mesa-vdpau-drivers mesa-va-drivers vulkan-tools vulkan-validationlayers libvulkan1 vkd3d-compiler vkbasalt primus-vk radeontop libavcodec-extra lm-sensors 
#apt install -y gnome-shell-extensions gnome-shell-extension-dash-to-panel gnome-shell-extension-top-icons-plus gnome-shell-extension-bluetooth-quick-connect gnome-shell-extension-desktop-icons-ng gnome-shell-extension-tiling-assistant
apt install -y gimp gimp-data-extras gimp-gmic inkscape krita krita-gmic blender audacity lmms lmms-common lmms-vst-server mono-complete dotnet-sdk-7.0 unityhub
apt install -y apt-transport-https
apt update -y
apt install -y code
#xPadNeo
apt-get install dkms linux-headers-`uname -r`
git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh
apt update -y
apt upgrade -y
echo 'Configure!'
#useradd -m user
#passwd -e user
#groupadd Admin
#groupadd Assets
#groupadd Office
#groupadd Marketing
