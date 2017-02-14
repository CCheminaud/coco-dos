#!/bin/bash

# install Antigen framework
if [ ! -d ~/.antigen ]; then
    mkdir ~/.antigen
    curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > ~/.antigen/antigen.zsh
fi

# install powerline patched font
cp ./fonts/* ~/.local/share/fonts/
fc-cache -fv

# backup old .zshrc
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bck
fi

ln -s "$(pwd)/.zshrc" ~/.zshrc
