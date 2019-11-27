" Highlights {{{
highlight UserRed ctermbg=Red ctermfg=Black
highlight UserYellow ctermbg=Yellow ctermfg=Black
highlight UserGreen ctermbg=Green ctermfg=Black
highlight UserBlue ctermbg=Blue ctermfg=Black
highlight UserMagenta ctermbg=Magenta ctermfg=Black
highlight UserCyan ctermbg=Cyan ctermfg=Black
highlight UserWhite ctermbg=White ctermfg=Black
" }}}

" Manual Commands {{{
command!          ColorHi    call <SID>PrintCustomHighlights()
command! -nargs=+ ColorHiAdd call <SID>AddCustomHighlight(<f-args>)
command! -nargs=1 ColorHiDel call <SID>DeleteCustomHighlight(<f-args>)
command!          ColorHiClr call <SID>ClearCustomHighlights()
" }}}

" CWord Commands {{{
command! ColorHiRed     call <SID>AddCustomHighlight(expand("<cword>"), "UserRed")
command! ColorHiYellow  call <SID>AddCustomHighlight(expand("<cword>"), "UserYellow")
command! ColorHiGreen   call <SID>AddCustomHighlight(expand("<cword>"), "UserGreen")
command! ColorHiBlue    call <SID>AddCustomHighlight(expand("<cword>"), "UserBlue")
command! ColorHiMagenta call <SID>AddCustomHighlight(expand("<cword>"), "UserMagenta")
command! ColorHiCyan    call <SID>AddCustomHighlight(expand("<cword>"), "UserCyan")
command! ColorHiWhite   call <SID>AddCustomHighlight(expand("<cword>"), "UserWhite")

command! ColorHiErase silent call <SID>DeleteCustomHighlight(expand("<cword>"))
"}}}

" Mappings {{{
nnoremap <silent> <Leader>cr :ColorHiRed<CR>
nnoremap <silent> <Leader>cy :ColorHiYellow<CR>
nnoremap <silent> <Leader>cg :ColorHiGreen<CR>
nnoremap <silent> <Leader>cb :ColorHiBlue<CR>
nnoremap <silent> <Leader>cm :ColorHiMagenta<CR>
nnoremap <silent> <Leader>ca :ColorHiCyan<CR>
nnoremap <silent> <Leader>cw :ColorHiWhite<CR>

nnoremap <silent> <Leader>cc :ColorHiErase<CR>
nnoremap <silent> <Leader>c0 :ColorHiClr<CR>
nnoremap <silent> <Leader>cp :ColorHi<CR>
" }}}

" Functions {{{
let s:customHighlights = {}

function! s:AddCustomHighlight(pattern, color, ...)
    let name = a:pattern
    if a:0 >= 1
        let name = a:1
    endif
    call <SID>DeleteCustomHighlight(name)
    let s:customHighlights[name] = matchadd(a:color, a:pattern)
endfunction

function! s:DeleteCustomHighlight(name)
    if has_key(s:customHighlights, a:name)
        call matchdelete(s:customHighlights[a:name])
        unlet s:customHighlights[a:name]
    endif
endfunction

function! s:ClearCustomHighlights()
    for value in values(s:customHighlights)
        call matchdelete(value)
    endfor
    let s:customHighlights = {}
endfunction

function! s:PrintCustomHighlights()
    let matches = getmatches()
    for [key, value] in items(s:customHighlights)
        for m in matches
            if m['id'] == value
                execute "echohl" m['group']
                echo key
            endif
        endfor
    endfor
    echohl None
endfunction
" }}}
