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
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# ~/.zshrc // plugins=(zsh-autosuggestions)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# ~/.zshrc // plugins=(zsh-syntax-highlighting)

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sudo chsh zanywhale -s /bin/zsh

# Get .ssh keyfiles
# Change default ssh port (/etc/ssh/sshd_config) // sudo service ssh restart

