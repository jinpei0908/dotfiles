#!/bin/bash

rc_files=(.vimrc .bashrc)

for file in ${rc_files[@]}; do
    ln -sf ~/dotfiles/"$file" ~/"$file"
done

source ~/.bashrc

