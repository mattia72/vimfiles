"=============================================================================
" File:          autocmds.vimrc
" Author:        Mattia72 
" Description:   auto commands for VIM   
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Automatically executed commands
"-------------------------------------------------------------------------------

" set cursor color and blink
function! g:MySetGuiCursorColor()
  if has('gui_running')
    hi Cursor guifg=black guibg=white
    hi iCursor guifg=black guibg=green
  endif
endfunction

function! g:MySetTerminalCursorColor(cursor_color)
  if !has('gui_running')
    " Cursor color for mintty
    :!echo -ne "\e]12;".a:cursor_color."\x07"
  endif
endfunction

" Only do this part when compiled with support for autocommands.
if !has("autocmd")
  finish
endif

function! g:MyDelRuler()
  augroup! MyRuler
endfunction

function! g:MySetRuler()
  "if has('gui_running')
  augroup MyRuler
    autocmd!
    " Line numbers on the first window
    autocmd WinEnter * setlocal rnu nu "relativenumber number
    autocmd WinEnter * setlocal cursorcolumn "Highlight the screen column of the cursor

    " linenumbers only in active window
    autocmd WinLeave * setlocal nornu nonu 
    autocmd WinLeave * setlocal nocursorcolumn "Highlight the screen column of the cursor
  augroup END
  "endif
endfunction

function! g:MyMakeView()
  " Put these in an autocmd group, so that we can delete them easily.
  augroup MyView
    autocmd!
    " save/load view
    autocmd BufWinLeave ?* silent! mkview
    autocmd BufWinEnter ?* silent! loadview "silent! no error message if there is no file name

  augroup END
endfunction

" When vimrc is edited, reload it
autocmd BufWritePost *vimrc source $MYVIMRC

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"autocmd FileType xml NeoBundleSource xml.vim
"autocmd FileType perl NeoBundleSource perl-support 
"autocmd FileType coffe NeoBundleSource vim-coffe-script
"autocmd FileType ps1 NeoBundleSource vim-ps1
"autocmd FileType abinitio NeoBundleSource vim-abinitio

if has('gui_running')
  " set cursor color and blink
  autocmd ColorScheme * call g:MySetGuiCursorColor()
  autocmd WinEnter * call g:MySetGuiCursorColor()
else
  "autocmd InsertEnter * call g:MySetTerminalCursorColor('#00FF00')
  "autocmd InsertLeave * call g:MySetTerminalCursorColor('#0000FF')
endif

call MySetRuler()
"call MyMakeView() " using kopischke/vim-stay instead

" if has("autocmd") !!!

" vim:tw=78:ts=4:ft=vim:norl:

