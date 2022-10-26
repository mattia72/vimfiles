"=============================================================================
" File:          common.vimrc
" Author:        Mattia72 
" Description:   common, everywhere usable functions for VIM   
" Created:       26 okt. 2022
"=============================================================================

function! g:MyEchoMessage(msg)
    let fname = resolve(expand('<sfile>:t'))
    echohl StatusLineNC | echo fname.': '.a:msg | echohl None
endfunction
