"=============================================================================
" File:          autocmds.vimrc
" Author:        Mattia72 
" Description:   auto commands for VIM   
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Automatically executed commands
"-------------------------------------------------------------------------------

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

function! g:MySetTerminalCursorColor(cursor_color)
  " Cursor color for mintty
  :!echo -ne "\e]12;".a:cursor_color."\x07"
endfunction

function! g:MyMakeView()
  " Put these in an autocmd group, so that we can delete them easily.
  augroup MyView
    autocmd!  " save/load view
    autocmd BufWinLeave ?* silent! mkview
    autocmd BufWinEnter ?* silent! loadview "silent! no error message if there is no file name
  augroup END
endfunctio

" When vimrc is edited, reload it
augroup reread_vimrc
  au!
  au BufWritePost *vimrc source $MYVIMRC | LightlineReload()
augroup END

" close quickfix with esc
augroup quickfix_close_with_esc
  autocmd!
  autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
  "doesn't work with q :(
  "autocmd FileType qf if mapcheck('q', 'n') ==# '' | nnoremap <buffer><silent> q :cclose<bar>lclose<CR> | endif
augroup END

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"autocmd InsertEnter * call g:MySetTerminalCursorColor('#00FF00')
"autocmd InsertLeave * call g:MySetTerminalCursorColor('#0000FF')

call MySetRuler()
"call MyMakeView() " using kopischke/vim-stay instead

" vim:tw=78:ts=4:ft=vim:norl:

