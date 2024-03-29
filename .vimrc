if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin('~/.cache/dein')

call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#add('tpope/vim-surround')
call dein#add('itchyny/lightline.vim')

" LSP
call dein#add('prabirshrestha/vim-lsp')
call dein#add('mattn/vim-lsp-settings')

" ddc
call dein#add('Shougo/ddc.vim')
call dein#add('shun/ddc-vim-lsp')
call dein#add('vim-denops/denops.vim')
call dein#add('vim-skk/skkeleton')
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('matsui54/ddc-matcher_fuzzy')
call dein#add('LumaKernel/ddc-file')

call dein#add('jinpei0908/totsuzen-no-shi')

call dein#end()

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

" ウインドウ分割
set splitbelow
set splitright

" Other setting
syntax on
set wildmode=longest,list
set shell=/opt/homebrew/bin/bash
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
    autocmd BufNewFile *.bash call setline(1, '#!/bin/bash')
    autocmd BufWritePre * LspDocumentFormatSync
augroup END

" lightline.vim
set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}

" ddc
call ddc#custom#patch_global('sources', [
            \   'vim-lsp',
            \   'file',
            \   'around'
            \ ])
call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_fuzzy'],
            \   'sorters': ['sorter_rank']
            \ },
            \ 'around': {'mark': 'around'},
            \ 'vim-lsp': {
            \   'mark': 'lsp'
            \ },
            \ 'file': {
            \   'mark': 'file',
            \   'isVolatile': v:true,
            \   'forceCompletionPattern': '\S/\S*',
            \ }})
call ddc#enable()

" lsp
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server', 'deno']
