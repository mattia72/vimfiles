"-------------------------------------------------------------------------------
" Automatically executed commands
"-------------------------------------------------------------------------------

" set cursor color and blink
function! g:MySetGuiCursor()
  set guicursor=
  "hi Cursor gui=reverse guifg=NONE guibg=NONE
  hi Cursor guifg=black guibg=white
  hi iCursor guifg=black guibg=green
  "let &guicursor = substitute(&guicursor, 'n-v-c:', '&blinkon0-', '')
  "let &guicursor = substitute(&guicursor, 'i:', '&ver100-iCursor', '')
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0 "no blinking on normal, visual, command mode
  set guicursor+=i:blinkwait10
endfunction

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    autocmd!

    " Line numbers on the first window
    autocmd BufWinEnter * setlocal rnu "relativenumber
    autocmd BufWinEnter * setlocal nu "number
    autocmd WinEnter * setlocal rnu "relativenumber
    autocmd WinEnter * setlocal nu "number
    " linenumbers only in active window
    autocmd WinLeave * setlocal nornu
    autocmd WinLeave * setlocal nonu

    " save/load view
    autocmd BufWinLeave ?* silent! mkview
    autocmd BufWinEnter ?* silent! loadview "silent! no error message if there is no file name

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

		autocmd FileType xml NeoBundleSource xml.vim
		autocmd FileType perl NeoBundleSource perl-support 
		autocmd FileType coffe NeoBundleSource vim-coffe-script
		autocmd FileType ps1 NeoBundleSource vim-ps1
		autocmd FileType abinitio NeoBundleSource vim-abinitio
    
    " set cursor color and blink
    autocmd ColorScheme * call g:MySetGuiCursor()             
    autocmd BufWinEnter * call g:MySetGuiCursor()
  augroup END
endif " has("autocmd")

