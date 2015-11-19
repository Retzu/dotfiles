#!/bin/bash

if [[ ! -d .git ]]; then
    echo "Run this script inside the cloned folder" 1>&2
    exit 1
fi

PWD=$(pwd)

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

# Vim ############################
rm ${HOME}/.vimrc
ln -s "${PWD}/.vimrc" "${HOME}/.vimrc"
##################################
