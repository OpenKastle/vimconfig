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
set foldlevelstart=99
set scrolloff=0
set cursorline
set cursorlineopt=number
" }}}

" Misc {{{
syntax on
filetype plugin indent on

colorscheme orion

highlight ColorColumn ctermbg=magenta ctermfg=white

augroup MatchAutocommands
    autocmd!
    autocmd VimEnter,BufNew,TabNew,WinNew * silent! if !exists('w:matchColumnLimit') | let w:matchColumnLimit = matchadd('ColorColumn', '\%101v', 100) | endif

    " Highlight trailing whitespace as error only if we can't match the cursor position before the end
    " of line (i.e. when we're in insert mode and \%# == $)
    autocmd VimEnter,BufNew,TabNew,WinNew * silent! if !exists('w:matchTrailingWhitespace') | let w:matchTrailingWhitespace = matchadd('Error', '\s\+\%#\@<!$') | endif
augroup end

command! MakeTags !ctags -R .

inoremap jk <Esc>
let mapleader="\<Space>"

nnoremap <Leader>o o<Esc>O
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>H i--------------------------------------------------------------------------------<CR><Esc>

inoremap <C-u> <Esc>g~iwea

nnoremap <Leader>/ :windo normal! ggg?G<CR>

function! SplitLines()
    execute "normal! i\<CR>\<ESC>k:silent! s/\\s\\+$//\<CR>j0"
endfunction

nnoremap K :call SplitLines()<CR>
" }}}

" NERDTree {{{
nnoremap <Leader>n :NERDTreeToggle<CR>
" }}}

" Tagbar {{{
nnoremap <Leader>m :TagbarToggle<CR>
" }}}

" Goyo {{{
command! Writemode setlocal spell | setlocal wrap | setlocal linebreak | Goyo
command! Codemode  Goyo! | setlocal nospell | setlocal nowrap | setlocal nolinebreak
" }}}

" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {}
" }}}

" CtrlP {{{
let g:ctrlp_custom_ignore = { 'dir': 'build$' }
" }}}

" Syntastic {{{
let g:syntastic_python_checkers = ['flake8']
" }}}

" Python {{{
command! PythonRun terminal python3 %
command! PythonRunVertical vertical terminal python3 %
nnoremap <Leader>p :PythonRun<CR>
nnoremap <Leader><Leader>p :PythonRunVertical<CR>
" }}}

" Markdown {{{
function! MarkdownLevel()
    let h = matchstr(getline(v:lnum), '^\s*\zs#\+')
    if empty(h)
        return "="
    else
        return ">" . len(h)
    endif
endfunction

augroup markdown_commands
    autocmd!
    autocmd FileType,Syntax markdown setlocal foldexpr=MarkdownLevel()
    autocmd FileType,Syntax markdown setlocal foldmethod=expr
    autocmd FileType,Syntax markdown setlocal wrap
    autocmd FileType,Syntax markdown setlocal linebreak
    autocmd FileType,Syntax markdown hi Title ctermfg=Cyan
    autocmd FileType,Syntax markdown hi Special ctermfg=Green
    autocmd FileType,Syntax markdown hi htmlTagName ctermfg=DarkCyan
augroup end
" }}}

" Vim files {{{
augroup filetypevim_commands
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end
" }}}

" Statusline {{{
set statusline=%f\ %y\ %m%=[line\ %l]\ [col\ %c]\ [%P]

highlight StatusLine ctermfg=White ctermbg=Blue term=none cterm=bold

augroup statusline_commands
    autocmd!
    autocmd InsertEnter * highlight StatusLine ctermfg=White ctermbg=Magenta term=none cterm=bold
    autocmd InsertLeave * highlight StatusLine ctermfg=White ctermbg=Blue term=none cterm=bold
augroup end
" }}}
