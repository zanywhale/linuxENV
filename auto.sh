#!/bin/bash

## Based on Ubuntu 18.04
# Default
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo sed -i 's/kr.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
sudo sed -i 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
sudo sed -i 's/us.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
sudo sed -i 's/us.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get upgrade -y

# Utility
sudo apt-get install openssh-server ssh vim tmux git zsh net-tools curl python3-pip -y
sudo apt-get install htop -y

# libc32
sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 gcc-6-multilib -y

# zsh
git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# ~/.zshrc // plugins=(zsh-autosuggestions)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# ~/.zshrc // plugins=(zsh-syntax-highlighting)

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sudo chsh zanywhale -s /bin/zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# ~/.zshrc // plugins=(fzf)

echo unsetopt share_history >> ~/.zshrc

# tmux
git clone https://github.com/zanywhale/.tmux.git ~/.tmux
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# pip, pwntools
sudo apt-get install python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential -y
sudo pip install --upgrade pip
sudo pip install --upgrade pwntools

# gdb peda
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
sudo echo "source ~/peda/peda.py" >> /root/.gdbinit

# Get .ssh keyfiles
# Change default ssh port (/etc/ssh/sshd_config) // sudo service ssh restart
