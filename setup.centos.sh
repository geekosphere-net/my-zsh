#!/bin/bash

# setup repos
sudo yum install -y epel-release
sudo yum install -y git wget yum-utils net-tools kernel-headers kernel-devel gcc zsh vim figlet

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
chmod -R go-rwx ~/.oh-my-zsh/custom/plugins/zsh-completions

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



