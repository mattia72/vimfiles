"=============================================================================
" File:          common.vim
" Author:        Mattia72 
" Description:   common, everywhere usable functions
" Created:       26 okt. 2022
"=============================================================================

function! g:common#MyEchoHlMessage(hi, pre, ...)
    if a:hi ==# 'StatusLineNC' 
      echohl StatusLineNC 
    elseif a:hi ==# 'ModeMsg' 
      echohl ModeMsg 
    endif
    echo '['.a:pre.']: '.join(a:000)
    echohl None
endfunction

function! g:common#MyEchoStatus(...)
  let msg = join(a:000[1:]) " slice first 
  call common#MyEchoHlMessage('StatusLineNC', a:1, msg)
endfunction

function! g:common#MyEchoModeMsg(...)
  let msg = join(a:000[1:]) " slice first 
  call common#MyEchoHlMessage('ModeMsg', a:1, msg)
endfunction

command! -nargs=+ EchoStatus  call common#MyEchoStatus(<f-args>)
command! -nargs=+ EchoModeMsg call common#MyEchoModeMsg(<f-args>)
