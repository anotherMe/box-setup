#!/bin/bash

MYUSER=""
PACKAGES=""


# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Read unprivileged user name
read -p "Please insert unprivileged user name: " -r
echo
MYUSER=$REPLY

read -p "Is $MYUSER correct [yY/nN] ? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	echo Exiting
	exit
fi


read -p "Update system before proceeding [yY/nN]? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Upgrading system ...
	apt-get update && apt-get -y upgrade
fi


read -p "Install sudo and add user to sudoers [yY/nN]? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Installing sudo ...
	apt-get -y install sudo
	gpasswd -a $MYUSER sudo
fi


# bare minimum
PACKAGES+=" vim screen htop screen iptraf ntp "

# window manager and desktop tools
PACKAGES+=" xorg xinit openbox openbox-menu obconf obmenu lxappearance tint2 nitrogen pcmanfm gmrun lightdm xscreensaver"

# other desktop tools
PACKAGES+=" mate-power-manager network-manager-gnome network-manager-openvpn-gnome volumeicon-alsa"

# goodies
PACKAGES+=" vim terminator geany firefox-esr qt4-qtconfig faenza-icon-theme"

# Dropbox dependencies
PACKAGES+=" libxslt1.1 "

# Samsung N900 firmware
#PACKAGES+= firmware-realtek firmware-brcm80211  

# Get ready for VBox additions
PACKAGES+=" build-essential linux-headers-amd64"

echo Installing ...
sudo apt-get install -y $PACKAGES


echo Checking out Openbox configuration files
cp -r /etc/xdg/openbox /home/${MYUSER}/.config/
cp -r .config/openbox /home/${MYUSER}/.config/
cp -r .config/gtk-3.0 /home/${MYUSER}/.config/


echo Fixing permission
chown -R $MYUSER:$MYUSER /home/${MYUSER}/.config

