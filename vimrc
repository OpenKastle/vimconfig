execute pathogen#infect()

set nocompatible
set number
set relativenumber
set showcmd
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set nowrap
set autoindent
set backspace=2
set hlsearch
set incsearch

set path+=**
set wildmenu

set nrformats=octal,hex,alpha

syntax on
filetype plugin indent on

highlight ColorColumn ctermbg=magenta ctermfg=white
call matchadd('ColorColumn', '\%101v', 100)

let g:netrw_banner=0        " Disable banner
let g:netrw_altv=1          " Open splits to the right
let g:netrw_liststyle=3     " Tree view

command! MakeTags !ctags -R .

inoremap jk <Esc>
let mapleader="\<Space>"

nnoremap <Leader>o o<Esc>O

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Tagbar
nnoremap <C-m> :TagbarToggle<CR>
