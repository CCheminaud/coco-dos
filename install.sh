#!/bin/bash

if [ ! -d '~/.antigen' ]; then
    mkdir ~/.antigen
    curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > ~/.antigen/antigen.zsh
fi

if [ ! -d '~/.fonts' ]; then
    mkdir ~/.fonts
fi

cp .fonts/* ~/.fonts/
fc-cache -fv

if [ -f '~/.zshrc' ] || [ -L '~/.zshrc' ]; then
    mv ~/.zshrc ~/.zshrc.bck
fi

ln -s "$(pwd)/.zshrc" ~/.zshrc
