#!/bin/bash
sudo apt update

###Set Variables
DEVELOPERNAME="Luke Reid"
EMAIL="developer@lukereid.dev"
GITREPODESTINATION="$HOME/DevEnvironment"

###Install Tools
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

sudo apt install -y imagemagick
sudo apt install -y build-essential cmake vim-nox python3-dev
sudo apt install -y mono-complete golang nodejs default-jdk npm

#Setup GPG https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
#Add GPG key to Github
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
git config --global commit.gpgsign true

#Setup SSH Keys https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
#Add SSH key to git
ssh-keygen -t ed25519 -C "$EMAIL"

###Copy setup config/scripts from Git repo
git clone git@github.com:LukeGReid/DevEnvironment.git ~/DevEnvironment
cp -f "$GITREPODESTINATION/Vim/.vimrc" ~/
cp -f "$GITREPODESTINATION/Git/.gitignore_global" ~/
mkdir -p .config/yamllint/
cp -f "$GITREPODESTINATION/Vim/.config/yamllint/.config" ~/.config/yamllint/

#Setup git
git config --global user.name "$DEVELOPERNAME"
git config --global user.email "$EMAIL"
git config --global core.excludesfile ~/.gitignore_global

###Setup Vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100
#Vundle plugin installer
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Plugins - individual plugins found in the .vimrc file
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe || return
git submodule update --init --recursive
python3 install.py --clangd-completer --cs-completer --ts-completer