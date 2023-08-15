KDE Neon Installer
=========================

<img src="https://raw.githubusercontent.com/boospy/KDE-Neon-Installer/master/Logo-KDE-Neon.png" width="" height="128">


**You would like to show your appreciation for our help 8-o. Gladly. We thank you for your donation! ;)**

<a href="https://www.paypal.com/donate/?hosted_button_id=JTFYJYVH37MNE">
  <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif">
</a>

The script installs after the standard setup of NEON, selected application to it and configures the system for an optimal operability. You can change everything in this script as you like. If you don't want to have something, then comment out the relevant area with "#". Or if you want to activate something, remove the "#" from that area.

# What does it exactly do at default with no changes of the script?

  * Delete the local preinstalled package pool
  * Add ITEAS enterprise repository https://apt.iteas.at
  * Add MakeMKV repository (multimedia save your DVD and Blurays)
  * Add Papirus repository (theme customzer)
  * Add brave-browser repository and install the brave-browser for more security
  * Install all ca-certifactes from iteas-enterprise
  * Update the whole System
  * Install thirdpartdrivers with ubuntu-drivers
  * Adjusting the much too low values in sysctl
  * Add some domains to avahi-daemon and add also the avahi example services (ssh,sftp)
  * Install special nerdfont for ZSH as defaultshell
  * Add nano syntax highlighting
  * Set zshfix for snaps

### The following packages will be uninstalled
  
  * kwrite
  * flatpak
  * plasma-discover-backend-flatpak
  * timidity
  
### The following packages will be installed

  * zsh
  * ssh
  * htop
  * tree
  * git
  * kate
  * kdf
  * dolphin-nextcloud
  * zsh
  * nfs-common
  * synaptic
  * aspell-de
  * hunspell-de-at
  * mpv (mediaplayer)
  * gnupg-agent
  * kleopatra (key and certmanagement for KDE)
  * gnome-icon-theme
  * mlocate
  * kdepim-addons (calendaraddon for the plasmapanel)
  * qt5-style-kvantum-themes
  * materia-kde
  * papirus-folders
  * digikam (Photo management)
  * akonadi-backend-sqlite
  * korganizer
  * showfoto
  * kipi-plugins (for digikam)
  * kde-config-cron
  * dolphin-plugins
  * filelight
  * kcolorchooser
  * soundkonverter
  * kcalc
  * partitionmanager
  * kronometer
  * kfind
  * strawberry (Music management)
  * audacity
  * unp (unzipfrontend for CMD)
  * kubuntu-restricted-extras
  * katomic (little game)
  * simplescreenrecorder (record everything on your screen)
  * avahi-utils
  * tellico
  * kio-stash
  * language-pack-gnome-de
  * finger
  * onlyoffice-desktopeditors
  * master-pdf-editor-5 (edit your pdf documents)
  * gnome-disk-utility
  * rustdesk (remote adminstration)
  * bitwarden (password management)
  * k3b discburner

# And you can choose from the following options in the script

  * Set an apt-acher or squid-deb-proxy
  * Install UCS Univention Domain Connection (Univention)
  * Install Google Chrome
  * complete communication suite Kontact, incl. all plugins and extensions
  * Teamviewer
  * optional Virtualbox LTS Version
  * Messenger Microsoft Teams, Telegram, Signal
  * Professional photo editing with Gimp and Darktable
  * Puppet Connection to ITEAS IT Services Gmbh.

### Use packages that my colleagues in us office also have installed (ITEAS Employees)

  * nload
  * openfortigui (Fortigate SSL-VPN-Client)
  * openfortigui-runner
  * virt-viewer
  * hpmyroom (HPE)
  * pwgen
  * konversation
  * ldap-utils
  * speedtest-cli
  * filezilla
  * filezilla-theme-papirus
  * nmapsi4 (QT portscanner frontend)
  * realvnc-vnc-viewer
  * smb4k
  * mactelnet-client
  * usb-creator-kde
  * manpages-de
  * preload (loads application into memory in advance)
  * krename
  * kompare
  * wireshark
  * kdenetwork-filesharing
  * gtkterm
  * samba
  * xca (Manage your own CA)
  * libpam-mount
  * davfs2
  * keyutils
  * draw.io
  * tinyotp (2factor for the desktop)
  
### optional ITEAS Developer Packages

  * okteta
  * manpages-de-dev
  * php-mbstring
  * composer
  * dbeaver-ce



INSTALLATION
------------

Run the following commands with SUDO or in a rootshell.

~~~
wget https://git.osit.cc/public-projects/kde-neon-installer/raw/master/kde-neon-22.04-installer.sh
chmod +x kde-neon-22.04-installer.sh
./kde-neon-22.04-installer.sh
~~~

If your country is blocked, you can download the script directly from Github: 

~~~
wget https://raw.githubusercontent.com/boospy/KDE-Neon-Installer/master/kde-neon-22.04-installer.sh
chmod +x kde-neon-22.04-installer.sh
./kde-neon-22.04-installer.sh
~~~

  
                 (__) 
                 (oo) 
           /------\/ 
          / |    ||   
         *  /\---/\ 
            ~~   ~~   
..."Have you mooed today?"...
