#!/usr/bin/env bash

# setup git
sudo yum -y remove git*
sudo yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install  git2u-all
git --version

# install some tools
sudo yum -y install vim htop tmux zsh

# install dotfiles
cd ~/
git clone https://github.com/rizaon/dotfiles.git
cd dotfiles
./install

# change shell
sudo sed -i "s|/home/$USER:/bin/bash|/home/$USER:/bin/zsh|g" /etc/passwd

