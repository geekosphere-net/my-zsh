#!/bin/bash

# copy sshkey

# setup basics
apt install -y wget curl net-tools zsh vim git git-flow apt-transport-https ca-certificates software-properties-common sysvbanner figlet

# setup OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
echo vim ~/.zshrc

# install vmware tools
mount /dev/cdrom /tmp/a
ln -s /mnt/hgfs/c /mnt/c
ln -s /mnt/hgfs/d /mnt/d


