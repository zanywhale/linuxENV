#!/bin/bash

## Based on Ubuntu 22.04
# Default
# sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
# sudo sed -i 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
# sudo sed -i 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
#sudo sed -i 's/us.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
# sudo sed -i 's/us.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
sudo apt update -y
sudo apt upgrade -y

# Utility
sudo apt install openssh-server ssh vim tmux git zsh net-tools curl htop -y

# For CTF
mkdir ~/tools

## Docker
sudo apt install curl -fsSL https://get.docker.com -o ~/tools/get-docker.sh -y
sudo sh ~/tools/get-docker.sh
sudo apt install doker-compose -y

## patchelf
sudo apt install dh-autoreconf -y
git clone https://github.com/NixOS/patchelf.git tools/patchelf
cd tools/patchelf
./bootstrap.sh
./configure
make
make check
sudo make install
### patchelf --set-interpterter ld ./binary
### patchelf --replace-needed libc.so.6 ./libc ./binary

## Pwntools
sudo apt install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
python3 -m pip install --upgrade pip -y
python3 -m pip install --upgrade pwntools -y

## pwndbg
git clone https://github.com/pwndbg/pwndbg ~/pwndbg
cd ~/pwndbg
./setup.sh
cd ~/

# zsh
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# ~/.zshrc // plugins=(zsh-autosuggestions)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# ~/.zshrc // plugins=(zsh-syntax-highlighting)

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sudo chsh -s `which zsh`

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# ~/.zshrc // plugins=(fzf)
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)
sudo sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf)/g' ~/.zshrc

echo unsetopt share_history >> ~/.zshrc

# tmux
git clone https://github.com/zanywhale/.tmux.git ~/.tmux
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Get .ssh keyfiles
# Change default ssh port (/etc/ssh/sshd_config) // sudo service ssh restart

# libc32
# sudo dpkg --add-architecture i386
# sudo apt update -y
# sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 gcc-6-multilib -y
