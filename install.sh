#!/bin/bash

ANTIGEN_VERSION=1.4.1

# remove old Antigen version
if [ -d ~/.antigen ]; then
    rm -rf ~/.antigen
fi

# install Antigen framework
mkdir ~/.antigen
curl "https://cdn.rawgit.com/zsh-users/antigen/v${ANTIGEN_VERSION}/bin/antigen.zsh" > ~/.antigen/antigen.zsh

# install powerline patched font
if [[ $EUID -ne 0 ]]; then
    cp ./fonts/* ~/.local/share/fonts/
    fc-cache -fv
fi

# backup old .zshrc
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bck
fi

ln -s "$(pwd)/.zshrc" ~/.zshrc
