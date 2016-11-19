#!/bin/bash

MYUSER=marco

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo Upgrading sistem
apt-get update && apt-get -y upgrade

echo Sudo installation & configuration
apt-get -y install sudo
gpasswd -a $MYUSER sudo

echo Installing bare minimum
apt-get -y install ntp vim screen htop

echo Installing OpenBox and Slim
apt-get -y install xorg xinit openbox openbox-menu obconf obmenu lxappearance tint2 nitrogen pcmanfm gmrun slim

echo Installing goodies
apt-get -y install vim terminator geany firefox-esr htop screen

echo Get ready for VBox additions
apt-get -y install build-essential linux-headers-amd64

echo Checking out Openbox configuration files
cp -r config/.config/openbox /home/${MYUSER}/.config/
cp -r config/.config/gtk-3.0 /home/${MYUSER}/.config/


echo Fix permission
chown -R $MYUSER:$MYUSER /home/${MYUSER}/.config

