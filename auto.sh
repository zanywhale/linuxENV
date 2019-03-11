#!/bin/bash

# Default
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo sed -i 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
sudo sed -i 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get upgrade -y

# Utility
sudo apt-get install ssh vim tmux git zsh -y
sudo apt-get install htop -y

# zsh
mkdir git
git clone https://github.com/robbyrussell/oh-my-zsh ~/git/oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/git/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/git/zsh-autosuggestions

# Get .ssh keyfiles
# Change default ssh port (/etc/ssh/sshd_config) // sudo service ssh restart

