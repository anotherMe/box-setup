#!/bin/bash

MYUSER=marco

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo Upgrading sistem
apt update && apt upgrade

echo Sudo installation & configuration
aptitude install sudo
gpasswd -a $MYUSER sudo

echo Installing bare minimum
apt install ntp vim screen htop

echo Installing OpenBox and Slim
# aptitude install xorg xinit openbox openbox-menu obconf obmenu lxappearance tint2 nitrogen pcmanfm gmrun slim

echo Installing goodies
apt install vim terminator geany firefox-esr htop screen

echo Checking out Openbox configuration files
echo TODO

echo Get ready for VBox additions
apt-get install build-essential linux-headers-amd64


