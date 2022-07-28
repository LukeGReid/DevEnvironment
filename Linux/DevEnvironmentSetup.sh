#!/bin/bash
sudo apt update

#install tools
apt install -y imagemagick
apt install -y yamllint

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs

#Setup git
git config --global user.name "Luke Reid"
git config --global user.email "Luke@LukeReid.dev"
touch ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

###Setup vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100
#Pathogen plugin installer
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#Plugins
git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale/
git clone https://github.com/Yggdroot/indentLine.git ~/.vim/bundle/indentline/