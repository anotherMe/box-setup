# config

A bash script for to set up an OpenBox environment on Debian.

## Install

Script applies to a Debian minimal install provided with git, sudo and a user in the sudo group:

  # apt-get install git sudo
  # gpasswd -a YOURUSER sudo

Log in with your user and:

  $ git clone https://github.com/anotherMe/config
  $ cd config
  $ ./debian_openbox.sh
