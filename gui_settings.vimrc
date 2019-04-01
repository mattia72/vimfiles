if has('nvim')
  augroup reread_ginit
    autocmd!
    autocmd BufWritePost *vimrc source $XDG_CONFIG_HOME/nvim/ginit.vim 
  augroup END
endif

set winaltkeys=menu " alt jumps to menu
set lines=45 columns=180 " set window size

set guicursor=
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0 "no blinking on normal, visual, command mode
set guicursor+=i:blinkwait10

syntax on

if has('nvim')
  GuiFont! Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
else
  set guifont=Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
endif

set listchars=eol:¬,tab:»»,trail:˙,extends:⮁,precedes:⮃,space:˙

"colors codedark
colors mattia
"colors molokai

" set cursor color and blink
function! g:MySetGuiCursorColor()
  hi Cursor guifg=black guibg=white
  hi iCursor guifg=black guibg=green
endfunction

                                     
autocmd ColorScheme * call g:MySetGuiCursorColor()
autocmd WinEnter * call g:MySetGuiCursorColor()
