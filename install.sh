#!/bin/bash

if [[ ! -d .git ]]; then
    echo "Run this script inside the cloned folder" 1>&2
    exit 1
fi

PWD=$(pwd)

# Ack ############################
rm -f ${HOME}/.ackrc
ln -s "${PWD}/.ackrc" "${HOME}/.ackrc"
##################################

# ZSH ############################
rm -f ${HOME}/.zshrc
ln -s "${PWD}/.zshrc" "${HOME}/.zshrc"

if [[ ! -d "${HOME}/.oh-my-zsh"  ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ${HOME}/.oh-my-zsh
fi
##################################

# Nvim ############################
rm -rf ${HOME}/.config/nvim
ln -s "${PWD}/nvim" "${HOME}/.config/nvim"
##################################
