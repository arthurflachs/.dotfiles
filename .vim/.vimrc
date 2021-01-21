""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 🍮 My .vimrc
"
" Maintainer: Arthur Flachs <arthur.flachs@gmail.com>
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable

" Config for coc.nvim
" See https://github.com/neoclide/coc.nvim example config file
" Quite messy
set hidden
set shortmess+=c
set cmdheight=2
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>


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
let g:gruvbox_color_column = 'aqua'
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

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" End of vim-plug
call plug#end()

set updatetime=100
