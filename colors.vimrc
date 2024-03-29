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

if has("gui_running") " in nvim it should be placed in ginit.vim
  colors onedark
  "colors mattia_blue
  "colors mattia
  "colors codedark
else
    "set term=xterm
    "set t_Co=256
    "let &t_AB="\e[48;5;%dm"
    "let &t_AF="\e[38;5;%dm"
    "colors mattia "ok in dos
    colors default "ok in dos
endif

