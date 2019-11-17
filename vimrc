" Pathogen {{{
execute pathogen#infect()
" }}}

" Options {{{
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
set splitbelow
set splitright
set laststatus=2
set path+=**
set wildmenu
set nrformats=octal,hex,alpha
" }}}

" Misc {{{
syntax on
filetype plugin indent on

highlight ColorColumn ctermbg=magenta ctermfg=white
call matchadd('ColorColumn', '\%101v', 100)

highlight Folded ctermbg=DarkCyan ctermfg=White

command! MakeTags !ctags -R .

inoremap jk <Esc>
let mapleader="\<Space>"

nnoremap <Leader>o o<Esc>O
nnoremap <Leader>h i--------------------------------------------------------------------------------<CR><Esc>
" }}}

" NERDTree {{{
nnoremap <leader>n :NERDTreeToggle<CR>
" }}}

" Tagbar {{{
nnoremap <leader>m :TagbarToggle<CR>
" }}}

" Goyo {{{
command Writemode setlocal spell | setlocal wrap | setlocal linebreak | Goyo
command Codemode  Goyo! | setlocal nospell | setlocal nowrap | setlocal nolinebreak
" }}}

" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
" }}}

" CtrlP {{{
let g:ctrlp_custom_ignore = { 'dir': 'build$' }
" }}}

" Syntastic {{{
let g:syntastic_python_checkers = ['flake8']
" }}}

" Python {{{
command PythonRun terminal python3 %
command PythonRunVertical vertical terminal python3 %
nnoremap <Leader>p :PythonRun<CR>
nnoremap <Leader><Leader>p :PythonRunVertical<CR>
" }}}

" Markdown {{{
function MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction

augroup markdown_commands
    autocmd!
    autocmd BufEnter *.md setlocal foldexpr=MarkdownLevel()
    autocmd BufEnter *.md setlocal foldmethod=expr
    autocmd BufEnter *.md hi Title ctermfg=Cyan
    autocmd BufEnter *.md hi Special ctermfg=Green
    autocmd BufEnter *.md hi htmlTagName ctermfg=DarkCyan
    autocmd BufEnter *.md normal zR<CR>
augroup END
" }}}

" Vim files {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Statusline {{{
highlight StatusLine ctermfg=Blue ctermbg=White

autocmd InsertEnter * highlight StatusLine ctermfg=Magenta ctermbg=White
autocmd InsertLeave * highlight StatusLine ctermfg=Blue ctermbg=White
" }}}
