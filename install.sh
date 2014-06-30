#!/bin/bash

if [[ -d .git ]]; then
    PWD=$(pwd)
else
    echo "Run this script inside the cloned folder" 1>&2
    exit 1
fi

ln -s "$PWD/.ackrc" $HOME/.ackrc
ln -s "$PWD/.vim/" $HOME/.vim
ln -s "$PWD/.vim/.vimrc" $HOME/.vimrc
