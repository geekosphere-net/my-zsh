#!/bin/bash

# setup basics
sudo apt-get update
sudo apt install -y wget curl net-tools zsh vim git git-flow apt-transport-https ca-certificates software-properties-common sysvbanner figlet 

# setup OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# git-flow-avh
wget --no-check-certificate -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh && sudo bash gitflow-installer.sh install stable; rm gitflow-installer.sh

# disable firewall
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo systemctl disable iptables
sudo systemctl stop iptables

# disable selinux
echo "SELINUX=disabled\nSELINUXTYPE=targeted\nSETLOCALDEFS=0" >> /tmp/selinuxconfig
[[ -f /etc/selinux/config ]] && sudo cp /etc/selinux/config /etc/selinux/config.orig
sudo mv /tmp/selinuxconfig /etc/selinux/config

# install vmware tools
sudo mkdir /tmp/a
sudo mount /dev/cdrom /tmp/a
sudo ln -s /mnt/hgfs/c /mnt/c
sudo ln -s /mnt/hgfs/d /mnt/d
figlet "install VMware Tools"



