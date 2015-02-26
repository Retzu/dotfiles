#!/bin/bash

if [[ -d .git ]]; then
    PWD=$(pwd)
else
    echo "Run this script inside the cloned folder" 1>&2
    exit 1
fi

git submodule init
git submodule update

# Ack ############################
rm ${HOME}/.ackrc
ln -s "${PWD}/.ackrc" "${HOME}/.ackrc"
##################################

# ZSH ############################
rm ${HOME}/.zshrc
ln -s "${PWD}/.zshrc" "${HOME}/.zshrc"

if [[ ! -d ${HOME}/.oh-my-zsh  ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ${HOME}/.oh-my-zsh
fi
##################################

# .Xresources ####################
rm ${HOME}/.Xresouces
ln -s "${PWD}/.Xresources" "${HOME}/.Xresources"
##################################

# Vim ############################
rm -rf ${HOME}/.vim
ln -s "${PWD}/vimfiles/" "${HOME}/.vim"

rm ${HOME}/.vimrc
ln -s "${PWD}/vimfiles/.vimrc" "${HOME}/.vimrc"

cd ${HOME}/.vim
git submodule init
git submodule update
##################################

# Ranger #########################
mkdir -p "${HOME}/.config/"
ln -s "${PWD}/ranger" "${HOME}/.config/ranger"
##################################
