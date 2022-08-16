#!/bin/bash
RED='\033[0;31m'
sudo apt install curl
echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list
curl -fsSL https://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_Head_on_a_Stick_obmenu-generator.gpg > /dev/null
sudo apt update
printf ${RED}'Install requirements\n'
sudo apt install python-is-python3 git rsync xserver-xorg-core x11-xserver-utils psmisc dunst nitrogen openbox rofi rxvt-unicode tint2 libgtk3-perl obmenu-generator pulseaudio mpd mpc ncmpcpp alsa-utils brightnessctl imagemagick scrot w3m-img wireless-tools xclip xsettingsd xss-lock thunar thunar-archive-plugin thunar-volman ffmpegthumbnailer tumbler htop nano neofetch geany gimp gsimplecal inkscape mpv parcellite pavucontrol viewnior xfce4-power-manager 
printf ${RED}'Is it successdfull?\n'
read
printf ${RED}'Install font\n'
#fonts
mkdir -pv ~/.fonts/{Cantarell,Comfortaa,IcoMoon-Custom,Nerd-Patched,Unifont}

wget --no-hsts -cNP ~/.fonts/Comfortaa/ https://raw.githubusercontent.com/googlefonts/comfortaa/main/fonts/OTF/Comfortaa-{Bold,Regular}.otf

wget --no-hsts -cNP ~/.fonts/IcoMoon-Custom/ https://github.com/owl4ce/dotfiles/releases/download/ng/{Feather,Material}.ttf

wget --no-hsts -cNP ~/.fonts/Nerd-Patched/ https://github.com/owl4ce/dotfiles/releases/download/ng/M+.1mn.Nerd.Font.Complete.ttf

wget --no-hsts -cNP ~/.fonts/Nerd-Patched/ https://github.com/owl4ce/dotfiles/releases/download/ng/{M+.1mn,Iosevka}.Nerd.Font.Complete.Mono.ttf

wget --no-hsts -cNP ~/.fonts/Unifont/ https://unifoundry.com/pub/unifont/unifont-14.0.02/font-builds/unifont-14.0.02.ttf

wget --no-hsts -cN https://download-fallback.gnome.org/sources/cantarell-fonts/0.303/cantarell-fonts-0.303.1.tar.xz

tar -xvf cantarell*.tar.xz --strip-components 2 --wildcards -C ~/.fonts/Cantarell/ \*/\*/Cantarell-VF.otf
printf ${RED}"Install icons\n"
#icons
mkdir -pv ~/.icons

wget --no-hsts -cN https://github.com/owl4ce/dotfiles/releases/download/ng/{Gladient_JfD,Papirus{,-Dark}-Custom}.tar.xz

 tar -xf Gladient_JfD.tar.xz -C ~/.icons/
 tar -xf Papirus-Custom.tar.xz -C ~/.icons/
 tar -xf Papirus-Dark-Custom.tar.xz -C ~/.icons/

 sudo ln -vs ~/.icons/Papirus-Custom /usr/share/icons/

 sudo ln -vs ~/.icons/Papirus-Dark-Custom /usr/share/icons/
 printf ${RED}"Install wallpapers\n"
#Wallpapers
 mkdir -pv ~/.wallpapers/{mechanical,eyecandy}

 wget --no-hsts -cNP ~/.wallpapers/mechanical/ https://github.com/owl4ce/dotfiles/releases/download/ng/{batik-1_4K,okita-souji_FHD}.jpg

 wget --no-hsts -cNP ~/.wallpapers/eyecandy/ https://github.com/owl4ce/dotfiles/releases/download/ng/{cherry-blossoms,floral-artistic-2}_FHD.jpg
#ext
  mkdir -pv ~/.urxvt/ext

 (cd ~/.urxvt/ext/; curl -LO https://raw.githubusercontent.com/simmel/urxvt-resize-font/master/resize-font)

 (cd ~/.urxvt/ext/; curl -LO https://raw.githubusercontent.com/mina86/urxvt-tabbedex/master/tabbedex)
printf ${RED}"Configuring......................\n"
#install
cd ~/Documents/
git clone --depth 1 --recurse-submodules https://github.com/owl4ce/dotfiles.git
rsync -avxHAXP --exclude-from=- dotfiles/. ~/ << "EXCLUDE"
.git*
LICENSE
*.md
EXTRA_JOYFUL
EXCLUDE
rsync -avxHAXP --exclude-from=- dotfiles/EXTRA_JOYFUL/. ~/ << "EXCLUDE"
.git*
neofetch
EXCLUDE
#check fonts
printf ${RED}"Check fonts\n"
fc-cache -rv
#run
printf ${RED}"Show power-manager\n"
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/show-tray-icon -n -t bool -s true
