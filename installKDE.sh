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
sudo apt install -y kde-standard
sudo apt install -y apt install -y firefox-esr firefox-esr-l10n-hu thunderbird g3dviewer vlc libreoffice gufw clamtk jstest-gtk 
apt install -y mesa-utils mesa-utils-extra mesa-vulkan-drivers mesa-vdpau-drivers mesa-va-drivers vulkan-tools vulkan-validationlayers libvulkan1 vkd3d-compiler vkbasalt primus-vk radeontop libavcodec-extra lm-sensors 
apt install -y gimp gimp-data-extras gimp-gmic inkscape blender audacity mono-complete dotnet-sdk-7.0 unityhub
apt install -y apt-transport-https
apt update -y
apt install -y code
