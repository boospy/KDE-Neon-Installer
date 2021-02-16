#!/bin/bash

#
# (c) Mario Loderer, Mindguide
# mario@mindguide.cc
#

# update
pkcon refresh
pkcon update -y


# Hinzufügen von Repositories
apt-add-repository ppa:heyarje/makemkv-beta -n -y
apt-add-repository ppa:papirus/papirus -n -y
add-apt-repository ppa:univention-dev/ppa -n -y
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2FAB19E7CCB7F415
echo "deb http://apt.iteas.at/iteas focal main" > /etc/apt/sources.list.d/iteas.list
echo "deb http://liveusb.info/multisystem/depot all main" > /etc/apt/sources.list.d/multisystem.list
wget -q http://liveusb.info/multisystem/depot/multisystem.asc -O- | apt-key add -
apt update
apt remove kwrite snapd flatpak plasma-discover-backend-flatpak plasma-discover-backend-snap --purge -y
apt autoremove --purge -y

apt install zsh ssh htop tree git kate k3b k3b-extrathemes kdf dolphin-nextcloud zsh nfs-common synaptic aspell-de hunspell-de-at mpv text2speech-sound-thema ca-certificates-iteas-enterprise gnupg-agent libreoffice-kf5 libreoffice-help-de libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-l10n-de libreoffice-plasma libreoffice-writer libreoffice-templates libreoffice-qt5 kleopatra gnome-icon-theme mlocate kdepim-addons qt5-style-kvantum-themes materia-kde yakuake papirus-folders digikam akonadi-backend-sqlite korganizer showfoto kipi-plugins kde-config-cron dolphin-plugins qreator filelight kcolorchooser soundkonverter kcalc partitionmanager kronometer kfind strawberry audacity unp plasma-theme-oxygen kubuntu-restricted-extras katomic avahi-discover simplescreenrecorder keepassxc avahi-utils tellico rocketchat hamsket kio-stash language-pack-gnome-de finger -y

ubuntu-drivers autoinstall

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt install -fy

# Anpassen der viel zu niedrigen Werte in Sysctl
echo    "fs.file-max = 9223372036854775807" > /etc/sysctl.d/10-mindguide.conf
echo "fs.inotify.max_user_instances = 1024"  >> /etc/sysctl.d/10-mindguide.conf
echo "fs.inotify.max_user_watches = 5242880"  >> /etc/sysctl.d/10-mindguide.conf


# Installation des UCS Clients für Kerberos/AD Anbindung an Univention Server
DEBIAN_FRONTEND=noninteractive apt-get install univention-domain-join krb5-auth-dialog -y

echo "*.local" > /etc/mdns.allow
echo ".local" >> /etc/mdns.allow
echo "iteas.at" >> /etc/mdns.allow
echo "osit.cc" >> /etc/mdns.allow
cp /usr/share/doc/avahi-daemon/examples/s* /etc/avahi/services/.
systemctl restart avahi-daemon.service

# ITEAS Mitarbeiter 
apt install nload openfortigui openfortigui-runner virt-viewer hpmyroom remmina remmina-plugin-rdp pwgen konversation ldap-utils speedtest-cli x2goclient filezilla filezilla-theme-papirus nmapsi4 proxmox-spice-remoteviewer realvnc-vnc-viewer smb4k mactelnet-client multisystem usb-creator-kde manpages-de qfinderpro preload krename kopano-deskapp kopano-deskapp-kdeintegration kompare wireshark master-pdf-editor kdenetwork-filesharing gtkterm samba librecad xca libpam-mount davfs2 keyutils gnome-disk-utility gnome-disk-utility gnome-disk-utility draw.io tinyotp -y

# User Profile
#cd /root && git clone -b iteas_mitarbeiter https://git.styrion.net/iteas/KDE_Plasma5_Default_Profile.git && rm -r /etc/skel && mv KDE_Plasma5_Default_Profile /etc/skel && rm -r /etc/skel/.git

# optioanl ITEAS Developer Packages
# apt install okteta manpages-de-dev pycharm-community php-mbstring composer dbeaver-ce -y

# ZSH und Bash Configs 
# https://darkdevil.osit.cc/gitlab/public-projects/zsh-und-bash-configs
apt update
apt install zsh git -y
mkdir /usr/share/fonts/truetype/nerdfont && cd /usr/share/fonts/truetype/nerdfont
wget -O /tmp/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf https://darkdevil.osit.cc/gitlab/public-projects/zsh-und-bash-configs/raw/master/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf
mv /tmp/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf /usr/share/fonts/truetype/nerdfont/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf
fc-cache -fv
wget -O /root/.zshrc https://darkdevil.osit.cc/gitlab/public-projects/kde-neon-installer/raw/master/zshrc
wget -O /etc/skel/.zshrc https://darkdevil.osit.cc/gitlab/public-projects/kde-neon-installer/raw/master/zshrc
usermod -s /bin/zsh root
#wget -O /tmp/nano.tar https://darkdevil.osit.cc/gitlab/public-projects/zsh-und-bash-configs/raw/master/nano_syntax_highlighting.tar
#tar -xf /tmp/nano.tar -C /root
#tar -xf /tmp/nano.tar -C /etc/skel
#rm /tmp/nano.tar -f


# optional - komplette Kommunikationssuite Kontact, inkl. alle Plugins und Erweiterungen
# apt install kdepim -y

# optional Advanced Packages
# apt install choqok lm-sensors nvme-cli -y

# Experimentell Steam Abhängigkeit für NVIDIA
# apt install libnvidia-gl-440:i386

# optional Multimediapackages
# apt install openshot mkvtoolnix-gui makemkv-bin kdenlive -y

# optional Spotify
# wget -q -O "-" https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# apt update
# apt install spotify-client -y

# Teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
dpkg -i teamviewer_amd64.deb && apt install -fy


# optional Virtualbox LTS Version
# apt install virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso -y


# Puppetanbindung bei Firma ITEAS IT Services Gmbh.
cd /root
wget https://git.styrion.net/iteas/iteas-tools/raw/master/puppet/ubuntu_puppet.sh
chmod +x ubuntu_puppet.sh
apt remove timidity --purge -y
apt autoremove --purge -y
apt-get clean
