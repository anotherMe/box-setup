# config

A bash script to set up an OpenBox environment on Debian.

## Install

Script applies to a Debian minimal install provided with git, sudo and a user in the sudo group.

As root:

```bash
  apt-get install git sudo
  gpasswd -a YOURUSER sudo
```

Log in with your user and:

```bash
  git clone https://github.com/anotherMe/config
  cd config
  sudo ./debian_openbox.sh
```
