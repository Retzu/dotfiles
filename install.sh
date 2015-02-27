#!/bin/bash

if [[ ! -d .git ]]; then
    echo "Run this script inside the cloned folder" 1>&2
    exit 1
fi

PWD=$(pwd)

git submodule init
git submodule update

git submodule foreach --recursive git submodule init
git submodule foreach --recursive git submodule update

# Ack ############################
rm ${HOME}/.ackrc
ln -s "${PWD}/.ackrc" "${HOME}/.ackrc"
##################################

# ZSH ############################
rm ${HOME}/.zshrc
ln -s "${PWD}/.zshrc" "${HOME}/.zshrc"

if [[ ! -d "${HOME}/.oh-my-zsh"  ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ${HOME}/.oh-my-zsh
fi
##################################

# .Xresources ####################
rm ${HOME}/.Xresources
ln -s "${PWD}/.Xresources" "${HOME}/.Xresources"
##################################

# Vim ############################
rm -rf ${HOME}/.vim
ln -s "${PWD}/vimfiles/" "${HOME}/.vim"

rm ${HOME}/.vimrc
ln -s "${PWD}/vimfiles/.vimrc" "${HOME}/.vimrc"
##################################

# Ranger #########################
mkdir -p "${HOME}/.config/"
rm -rf "${HOME}/.config/ranger"
ln -s "${PWD}/ranger" "${HOME}/.config/ranger"
##################################

# i3wm ###########################
cd ${PWD}
rm -rf "${HOME}/.i3"
ln -s "${PWD}/i3" "${HOME}/.i3"
##################################
