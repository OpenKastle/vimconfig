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
set breakindent
set backspace=2
set hlsearch
set incsearch
set spelllang=en_us
set background=dark

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

" Goyo
command Writemode setlocal spell | setlocal wrap | setlocal linebreak | Goyo
command Codemode  Goyo! | setlocal nospell | setlocal nowrap | setlocal nolinebreak

" Syntastic
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }

nnoremap <Leader>h i--------------------------------------------------------------------------------<CR><Esc>

function MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
au BufEnter *.md hi Title ctermfg=Cyan
au BufEnter *.md hi Special ctermfg=Green
au BufEnter *.md hi htmlTagName ctermfg=DarkCyan
au BufEnter *.md normal zR<CR>
