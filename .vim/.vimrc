"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 🍮 My .vimrc
"
" Maintainer: Arthur Flachs <arthur.flachs@gmail.com>
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

" Indent option
set expandtab
set shiftwidth=4
set tabstop=4

" Avoid the <esc> key to exit insert mode
inoremap jk    <esc>
inoremap kj    <esc>
inoremap <esc> <nop>
inoremap <c-c> <nop>

" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug '~/vim-potion'

" End of vim-plug
call plug#end()
