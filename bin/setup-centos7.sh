#!/usr/bin/env bash

# ATTENTION: You need to setup ssh-agent and add private key first before running this script
# eval `ssh-agent`
# ssh-add -k ~/.ssh/your-private-key

# setup git
sudo yum remove git*
sudo yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install  git2u-all
git --version

# install some tools
sudo yum -y install htop tmux zsh

# install dotfiles
cd ~/
git clone git@github.infra.cloudera.com:rizaon/dotfiles.git
cd dotfiles
./install

# change shell
sudo sed -i 's|/home/systest:/bin/bash|/home/systest:/bin/zsh|g' /etc/passwd

