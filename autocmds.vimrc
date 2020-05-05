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


"function! g:MyMakeView()
  "" Put these in an autocmd group, so that we can delete them easily.
  "augroup MyView
    "autocmd!  " save/load view
    "autocmd BufWinLeave ?* silent! mkview
    "autocmd BufWinEnter ?* silent! loadview "silent! no error message if there is no file name
  "augroup END
"endfunctio

" When vimrc is edited, reload it
augroup reread_vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC
  autocmd BufWritePost *vimrc LightlineReload
  "autocmd FileType vim nnoremap <buffer> <F7> :w <bar> if expand('%:t') =~ '^t\(c\|est\)_' <bar> call unittest#run() <bar> else <bar> source % <bar> endif <cr>
  autocmd FileType vim nnoremap <buffer> <F7> :w <bar> source % <cr>
  autocmd FileType vim nnoremap <buffer> <F9> :w <bar> UnitTest <cr>
augroup END

augroup quickfix_autocmds
  autocmd!
  "autocmd FileType qf setlocal syntax=qf
  autocmd FileType qf nnoremap <buffer> <F5> :setlocal syntax=qf <cr>
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

