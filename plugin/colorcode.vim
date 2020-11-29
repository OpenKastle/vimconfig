" iabbrev |fg \[\033[38;5;Nm\]
" iabbrev |bg \[\033[48;5;Nm\]

command! -nargs=1 Fg call PutColorFg(<f-args>)
command! -nargs=1 Bg call PutColorBg(<f-args>)

function! PutColorFg(color)
    execute "normal i\\[\\033[38;5;" . a:color . "m\\]"
endfunction

function! PutColorBg(color)
    execute "normal i\\[\\033[48;5;" . a:color . "m\\]"
endfunction
