"=============================================================================
" File:          colors.vimrc
" Author:        Mattia72 
" Description:   Color shemas and helper functions for syntax plugin development   
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Colors
"-------------------------------------------------------------------------------

"colors koehler
"colors desert
"colors ir_black
"colors oceanblack
"colors oceandeep
"colors underwater
"colors blackboard
"colors molokai
"colors badwolf
"colors solarized
"colors impactjs-colorscheme
"colors wombat256i

if has("gui_running")
  colors my_molokai
else
  colors my_molokai
endif

" Show syntax highlighting groups for word under cursor: Ctrl Shift P
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <C-S-P> :call <SID>SynStack()<CR>
