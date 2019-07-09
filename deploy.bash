#!/bin/bash

rc_files=(.vimrc .bashrc)

for file in ${rc_files[@]}; do
    ln -sf ~/rc_files/"$file" ~/"$file"
done

