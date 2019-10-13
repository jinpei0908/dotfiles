" Character code
set encoding=utf-8

" Tab and indent setting
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set ignorecase
set smartcase
set number " Show line number
set title " Show title

set wildmenu " Complement commands

syntax on
set incsearch
set hlsearch

" Set autocmd
autocmd BufEnter [Mm]akefile set noexpandtab
autocmd BufEnter *.ya\\\{0,1\}ml set shiftwidth=2
autocmd BufEnter *.json set shiftwidth=2
autocmd BufNewFile *.bash call EnterSheBang()

" Function definition
function EnterSheBang()
    read !echo -n \\#\\!/bin/bash
    0d
endfunction

