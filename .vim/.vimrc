""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set number

" Enable syntax highlighting
syntax enable

" Avoid the <esc> key to exit insert mode
inoremap jk    <esc>
inoremap kj    <esc>
inoremap <esc> <nop>
inoremap <c-c> <nop>

" Load vim-plug
call plug#begin('~/.vim/plugged')

Plug '~/vim-potion'

" Gruvbox theme
Plug 'morhetz/gruvbox'
let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_number_column = 'bg1'
let g:gruvbox_italicize_strings = '1'
autocmd vimenter * ++nested colorscheme gruvbox

" Javascript syntax
Plug 'pangloss/vim-javascript'

" Typescript syntax
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim'
Plug '~/.dotfiles2/.vim/custom-plugins/pangloss-typescript-extension'

" JSX syntax
Plug 'MaxMEllon/vim-jsx-pretty'

" Vim Fugitive
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" End of vim-plug
call plug#end()

set updatetime=100
