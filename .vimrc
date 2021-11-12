if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#add('tpope/vim-surround')
    call dein#add('vim-airline/vim-airline')
    call dein#add('godlygeek/tabular')

    " Language server
    call dein#add('prabirshrestha/vim-lsp')
    call dein#add('mattn/vim-lsp-settings')

    " Auto complete
    call dein#add('prabirshrestha/asyncomplete.vim')
    call dein#add('prabirshrestha/asyncomplete-lsp.vim')
    call dein#add('Shougo/ddc.vim')
    call dein#add('vim-denops/denops.vim')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Character code
set encoding=utf-8

" Tab and indent setting
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Delete setting
set backspace=indent,eol,start

" Cursor and line setting
set cursorline
set cursorlineopt=number
set number

" Search setting
set ignorecase
set smartcase
set incsearch
set hlsearch

" Other setting
syntax on
set wildmenu " Complement commands
set shell=/usr/local/bin/bash
set dictionary=/usr/share/dict/words

" Key maps
inoremap {<Enter> {}<Left><CR><ESC>O
nnoremap <C-c> :noh<CR>

" Abbreviation
cabbrev vr vertical resize

" Set autocmd
augroup my_setting
    autocmd!
    autocmd BufEnter [Mm]akefile set noexpandtab
    autocmd BufEnter *.yaml,*.yml,*.json set shiftwidth=2
    autocmd BufNewFile *.bash call setline(1, '#!/usr/local/bin/bash')
    autocmd BufWritePre * LspDocumentFormatSync
augroup END

" ddc
call ddc#custom#patch_global('sources', 'around')
call ddc#custom#patch_global('sources', 'vim-lsp')
call ddc#enable()
