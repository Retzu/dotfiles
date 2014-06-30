#!/bin/bash

if [[ -d .git ]]; then
    PWD=$(pwd)
else
    echo "Run this script inside the cloned folder" 1>&2
    exit 1
fi

git submodule init
git submodule update

ln -s "$PWD/.ackrc" $HOME/.ackrc
ln -s "$PWD/.vim/" $HOME/.vim
ln -s "$PWD/.vim/.vimrc" $HOME/.vimrc

cd $HOME/.vim
git submodule init
git submodule update
