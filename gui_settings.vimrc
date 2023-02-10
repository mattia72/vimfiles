if has('nvim')
  augroup reread_ginit
    autocmd!
    autocmd BufWritePost *vimrc source $XDG_CONFIG_HOME/nvim/ginit.vim 
  augroup END
endif

" set cursor color and blink
function! g:MySetGuiCursorColor()
  hi Cursor guifg=black guibg=white
  hi iCursor guifg=black guibg=green
endfunction

set winaltkeys=menu " alt jumps to menu
set lines=45 columns=180 " set window size

set guicursor=
set guicursor=n-v-c:block,
\i-ci-ve:ver25-iCursor-blinkwait300-blinkon200-blinkoff200,
\r-cr:hor20,o:hor50,
\a:blinkwait500-blinkon200-blinkoff400-Cursor/iCursor,
\sm:block-blinkwait175-blinkon200-blinkoff200

syntax on
call g:MySetGuiCursorColor()

if has('nvim')
  "GuiFont! Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
  GuiFont! UbuntuMono\ NF:h12:cEASTEUROPE
else
  "set guifont=Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
  set guifont=UbuntuMono\ NF:h12:cEASTEUROPE
endif

set listchars=eol:¬,tab:-»,trail:˙,extends:⮁,precedes:⮃,space:˙

"source colors.vimrc
colors onedark

"autocmd ColorScheme * call g:MySetGuiCursorColor()
"autocmd WinEnter * call g:MySetGuiCursorColor()
"autocmd WinLeave * call g:MySetGuiCursorColor()
