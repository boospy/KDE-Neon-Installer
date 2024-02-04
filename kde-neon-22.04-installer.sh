#!/bin/bash

#
# (c) Mario Loderer, OpenSource-IT
# linux@osit.cc
#

#echo 'Acquire::http { Proxy "http://apt-cacher.osit.cc:3142"; };' | tee /etc/apt/apt.conf.d/01proxy
rm /etc/apt/sources.list.d/preinstalled-pool.list

gpg -k && gpg --no-default-keyring --keyring /usr/share/keyrings/iteas-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 23CAE45582EB0928
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/iteas-keyring.gpg] http://apt.iteas.at/iteas jammy main" > /etc/apt/sources.list.d/iteas.list

apt update
apt install ca-certificates-iteas-enterprise -y
apt dist-upgrade -dy


# update
pkcon update -y

# Hinzufügen von Repositories
# Adding repositories
apt-add-repository ppa:heyarje/makemkv-beta -n -y
apt-add-repository ppa:papirus/papirus -n -y


# UCS Univention Domänenanbindung
# UCS Univention Domain Connection
#add-apt-repository ppa:univention-dev/ppa -n -y

gpg -k

echo "deb http://ppa.launchpadcontent.net/papirus/papirus/ubuntu/ jammy main" > /etc/apt/sources.list.d/papirus-ubuntu-papirus-jammy.list
echo "deb http://ppa.launchpadcontent.net/heyarje/makemkv-beta/ubuntu/ jammy main" >  /etc/apt/sources.list.d/heyarje-ubuntu-makemkv-beta-jammy.list

apt update
apt remove kwrite flatpak plasma-discover-backend-flatpak --purge -y

apt install zsh ssh htop tree git kate kdf dolphin-nextcloud zsh nfs-common synaptic aspell-de hunspell-de-at mpv gnupg-agent kleopatra gnome-icon-theme mlocate kdepim-addons qt5-style-kvantum-themes materia-kde papirus-folders digikam akonadi-backend-sqlite korganizer showfoto kipi-plugins kde-config-cron dolphin-plugins filelight kcolorchooser soundkonverter kcalc partitionmanager kronometer kfind strawberry audacity unp kubuntu-restricted-extras katomic simplescreenrecorder avahi-utils tellico kio-stash language-pack-gnome-de finger onlyoffice-desktopeditors master-pdf-editor-5 gnome-disk-utility rustdesk bitwarden plasma-discover-backend-snap -y


# CD Brennen
# Disk burning
apt install k3b k3b-extrathemes -y

ubuntu-drivers install

# Google Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#dpkg -i google-chrome-stable_current_amd64.deb
#apt install -fy

# Brave Secure Browser
apt install curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] http://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y


# Anpassen der viel zu niedrigen Werte in Sysctl
# Adjusting the much too low values in Sysctl
echo    "fs.file-max = 9223372036854775807" > /etc/sysctl.d/10-osit.conf
echo "fs.inotify.max_user_instances = 1024"  >> /etc/sysctl.d/10-osit.conf
echo "fs.inotify.max_user_watches = 5242880"  >> /etc/sysctl.d/10-osit.conf



# Installation des UCS Clients für Kerberos/AD Anbindung an Univention Server
# Installation of the UCS client for Kerberos/AD connection to Univention server
#DEBIAN_FRONTEND=noninteractive apt-get install univention-domain-join krb5-auth-dialog -y

echo "*.local" > /etc/mdns.allow
echo ".local" >> /etc/mdns.allow
echo "iteas.at" >> /etc/mdns.allow
echo "osit.cc" >> /etc/mdns.allow
cp /usr/share/doc/avahi-daemon/examples/s* /etc/avahi/services/.
systemctl restart avahi-daemon.service

# ITEAS Mitarbeiter
# ITEAS Employees
#apt install nload openfortigui openfortigui-runner virt-viewer hpmyroom pwgen konversation ldap-utils speedtest-cli filezilla filezilla-theme-papirus nmapsi4 realvnc-vnc-viewer smb4k mactelnet-client usb-creator-kde manpages-de preload krename kompare wireshark kdenetwork-filesharing gtkterm samba xca libpam-mount davfs2 keyutils draw.io tinyotp-qt6 -y

# optional ITEAS Developer Packages
#apt install okteta manpages-de-dev php-mbstring composer dbeaver-ce -y

# ZSH-Shell
apt update
apt install zsh git -y
mkdir /usr/share/fonts/truetype/nerdfont && cd /usr/share/fonts/truetype/nerdfont
wget -O /tmp/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf https://github.com/boospy/ZSH-und-BASH-Configs/raw/master/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf
mv /tmp/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf /usr/share/fonts/truetype/nerdfont/Sauce_Code_Pro_Nerd_Font_Complete_Mono.ttf
fc-cache -fv
wget -O /root/.zshrc https://git.osit.cc/public-projects/zsh-und-bash-configs/raw/master/zshrc-rootV3
wget -O /etc/skel/.zshrc https://git.osit.cc/public-projects/zsh-und-bash-configs/raw/master/zshrc-userV3
usermod -s /bin/zsh root
wget -O /tmp/nano.tar https://github.com/boospy/ZSH-und-BASH-Configs/raw/master/nano_syntax_highlighting.tar
tar -xf /tmp/nano.tar -C /root
tar -xf /tmp/nano.tar -C /etc/skel
rm /tmp/nano.tar -f

# zshfix for Snaps
echo "emulate sh -c 'source /etc/profile'" >> /etc/zsh/zprofile

# Wenn du einen Epson Drucker/Scanner betreibst, dann kannst du die Treiberpakete und Software von hier installieren
# If you have an epson printer/scanner, then you can install drivers and software here
#apt install epson-inkjet-printer-escpr epsonscan2 epsonscan2-non-free-plugin -y

# Wenn du einen USB Drucker betreibst, kommentiere die nächste Zeile ein, das deaktiviert die automatische Installation von USB Druckern.
# If you use an USB printer, then comment in the next line, this will be disable the install printer automatic.
#apt purge ipp-usb && apt install libusb-0.1-4 -y


# komplette Kommunikationssuite Kontact, inkl. alle Plugins und Erweiterungen
# complete communication suite Kontact, incl. all plugins and extensions
#apt install accountsservice kdepim -y

# optional Multimediapackages
#apt install openshot-qt mkvtoolnix-gui makemkv-bin kdenlive -y

# Teamviewer... Rustdesk ist schon installiert
# Teamviewer... Rustdeskis already installed
#wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
#dpkg -i teamviewer_amd64.deb && apt install -fy

# Profi Fotobearbeitung
# Professional photo editing
#apt install gimp gimp-help-de darktable -y

# optional Virtualbox LTS Version
#apt install virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso -y

# optional Virtualbox 7
#wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
#echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian jammy contrib" > /etc/apt/sources.list.d/virtualbox.list
#apt install virtualbox-7.0 -y

# Messenger Microsoft Teams, Telegram, Signal, Zoom...
#snap install telegram-desktop zoom-client

# Install Microsoft Teams via deb package
#apt install teams-for-linux -y

# Install Signal via deb package
#wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
#cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
#echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | tee /etc/apt/sources.list.d/signal-xenial.list
#apt update
#apt install signal-desktop -y

# Puppetanbindung bei Firma ITEAS IT Services Gmbh.
#cd /root
#wget https://git.styrion.net/iteas/iteas-tools/raw/master/puppet/ubuntu_puppet.sh
#chmod +x ubuntu_puppet.sh

apt remove timidity --purge -y
apt autoremove --purge -y
apt dist-upgrade -y
apt-get clean
