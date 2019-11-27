function! WindowHasNeighbor(direction)
    " Position of the current window
    "
    " 1: Top
    " 2: Right
    " 3: Bottom
    " 4: Left
    let currentPosition = win_screenpos(winnr())

    " If the current row or column is 1, we are top-most or
    " left-most respectively
    if a:direction == 1
        return currentPosition[0] != 1;
    elseif a:direction == 4
        return currentPosition[1] != 1;
    endif

    let windowCount = winnr('$')

    " Check all windows to see if there is a window with a
    " greater row or column position than our own
    while windowCount > 0
        let windowPosition = win_screenpos(windowCount)
        let windowCount = windowCount - 1

        if (a:direction == 2 && (currentPosition[1] + winwidth(0)) < windowPosition[1])
            return 1
        elseif (a:direction == 3 && (currentPosition[0] + winheight(0)) < windowPosition[0])
            return 1
        endif
    endwhile
endfunction

function! WindowResizeMappings()
    if WindowHasNeighbor(2)
        nnoremap <C-h> 5<C-w><
        nnoremap <C-l> 5<C-w>>
    else
        nnoremap <C-h> 5<C-w>>
        nnoremap <C-l> 5<C-w><
    endif

    if WindowHasNeighbor(3)
        nnoremap <C-j> 5<C-w>+
        nnoremap <C-k> 5<C-w>-
    else
        nnoremap <C-j> 5<C-w>-
        nnoremap <C-k> 5<C-w>+
    endif
endfunction

autocmd! WinEnter * call WindowResizeMappings()
