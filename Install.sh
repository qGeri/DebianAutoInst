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
apt update -y
apt upgrade -y
echo 'Install Desktop Environment!'
apt install -y gnome-session gnome-calculator gnome-package-updater gnome-sound-recorder gnome-system-monitor gnome-terminal planner file-roller gnome-calendar gnome-clocks gnome-disk-utility gparted gnome-tweaks synaptic gedit gdebi nautilus nautilus-admin nautilus-data nautilus-extension-gnome-terminal nautilus-image-converter eog eog-plugins gcolor3 gedit-plugins gnome-passwordsafe gnome-shell-extension-manager gnome-font-viewer
apt install -y firefox-esr firefox-esr-l10n-hu thunderbird g3dviewer vlc libreoffice gufw clamtk clamtk-gnome dconf-editor jstest-gtk
apt install -y mesa-utils mesa-utils-extra mesa-vulkan-drivers mesa-vdpau-drivers mesa-va-drivers vulkan-tools vulkan-validationlayers libvulkan1 vkd3d-compiler vkbasalt primus-vk radeontop libavcodec-extra lm-sensors 
apt install -y gimp gimp-data-extras gimp-gmic inkscape blender audacity mono-complete dotnet-sdk-7.0 unityhub
apt install -y apt-transport-https
apt update -y
apt install -y code
apt install -y doublecmd-common doublecmd-gtk libunrar5 mplayer
#xPadNeo
apt-get install -y dkms linux-headers-`uname -r`
git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh
apt update -y
apt upgrade -y
#Steam!
dpkg --add-architecture i386
apt update
apt install -y steam-installer
apt install -y mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
apt install -y steam-devices
#DiscorUpdater
#alias update-discord='wget "https://discord.com/api/download?platform=linux&format=deb" -O ./discord.deb;sudo apt install ./discord.deb;sudo rm ./discord.deb'
#AppIndicator/KStatusNotifierItem support, Bluetooth Quick Connect, Favourites in AppGrid, firefox-pip, Overview-Background, replace-activities-label, Tiling Assistant

