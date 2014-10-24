#!/bin/bash

if [[ -d .git ]]; then
    PWD=$(pwd)
else
    echo "Run this script inside the cloned folder" 1>&2
    exit 1
fi

git submodule init
git submodule update

rm $HOME/.ackrc
ln -s "$PWD/.ackrc" $HOME/.ackrc

rm $HOME/.zshrc
ln -s "$PWD/.zshrc" $HOME/.zshrc

rm -rf $HOME/.vim
ln -s "$PWD/vimfiles/" $HOME/.vim

rm $HOME/.vimrc
ln -s "$PWD/vimfiles/.vimrc" $HOME/.vimrc

git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh

cd $HOME/.vim
git submodule init
git submodule update
