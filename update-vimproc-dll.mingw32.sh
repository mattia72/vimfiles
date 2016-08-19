#!/usr/bin/bash

pacman-upgrade
#pacman -S make
#mingw32: pacman -S mingw-w64-i686-gcc
#mingw64: pacman -S mingw-w64-x86_64-gcc
cd ~/.vim/neobundle/vimproc.vim/
make 
