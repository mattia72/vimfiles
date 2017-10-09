"=============================================================================
" File:          settings.vimrc
" Author:        Mattia72 
" Description:   settings for VIM   
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Indentation 
"-------------------------------------------------------------------------------

set autoindent "automatically set the indent of a new line (local to buffer)
set smartindent "do clever autoindenting (local to buffer)
set smarttab "a <Tab> in an indent inserts 'shiftwidth' spaces
set shiftwidth=2
set shiftround "round to 'shiftwidth' for "<<" and ">>"
set softtabstop=2
set tabstop=2
set expandtab "expand <Tab> to spaces in Insert mode (local to buffer)
set cindent "enable specific indenting for C code (local to buffer)
set cinoptions= "options for C-indenting (local to buffer)
set cinkeys=0{,0},0),:,0#,!^F,o,O,e "keys that trigger C-indenting in Insert mode (local to buffer)
set cinwords=if,else,while,do,for,switch "list of words that cause more C-indent (local to buffer)
set indentexpr=GetVimIndent() "expression used to obtain the indent of a line (local to buffer)
set indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\ "keys that trigger indenting with 'indentexpr' in Insert mode (local to buffer)
set copyindent "Copy whitespace for indenting from previous line (local to buffer)
set preserveindent "Preserve kind of whitespace when changing indent (local to buffer)


"-------------------------------------------------------------------------------
" Searching
"-------------------------------------------------------------------------------

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

"-------------------------------------------------------------------------------
" Editing
"-------------------------------------------------------------------------------

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set textwidth=78 " For all text files set 'textwidth' to 78 characters.
set virtualedit=all
set bufhidden=hide "This option specifies what happens when a buffer is no longer displayed in a window:
set formatoptions=tcqronl
set switchbuf=useopen,usetab
set viewdir=$HOME\.vim\view
set viewoptions=cursor,folds,slash,unix
set history=50   "keep 50 lines of command line history

"-------------------------------------------------------------------------------
" Completition
"-------------------------------------------------------------------------------

set wildmenu
set wildmode=full

"-------------------------------------------------------------------------------
" Jump or find file
"-------------------------------------------------------------------------------

set isfname+=32,38 " add space and '&' to filename chars
set autochdir "auto switch to the current file dir
set path+=.  " path to use gf - jump to file.
set path+=**  " path to use by :find anything reqursive
"let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')
"set cdpath+=.  " path to use gf - jump to file.
set suffixesadd=.pm,.pl

"set shell=C:\\msys32\\usr\\bin\\bash
"let $TMP="c:/tmp"

"-------------------------------------------------------------------------------
" GUI/Terminal
"-------------------------------------------------------------------------------

if has('win32')
  "own directory before the others...^= not +=
  set runtimepath^=~\.vim
  set runtimepath+=~\.vim\after
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if has('gui_running')
  set winaltkeys=menu " alt jumps to menu
  set lines=40 columns=130 " set window size

  set guicursor=
  set guicursor+=i:ver100-iCursor
  set guicursor+=n-v-c:blinkon0 "no blinking on normal, visual, command mode
  set guicursor+=i:blinkwait10
else
  set term=xterm
  set t_Co=256
  "repair backspace: 
  "Why C-Del? Try this in command mode :verbose imap Ctr-V+BS
  inoremap <C-Del> <BS>
  nnoremap <C-Del> <BS>

  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  let &t_ti.="\e[1 q" " enter termcap mode
  let &t_SI.="\e[1 q" " start insert mode
  let &t_EI.="\e[4 q" " end insert mode
  let &t_te.="\e[0 q" " out of termcap mode
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has('gui_running')
  syntax on
endif

if has('gui_running')
  set cursorcolumn nocursorline "Highlight only the screen column of the cursor
else
  set nocursorcolumn nocursorline
endif

let &guioptions = substitute(&guioptions, "t", "", "g") "For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
set guioptions+=bh "horizontal scrollbar
set nowrap
set ruler		 "show the cursor position all the time
set showcmd		 "display incomplete commands
set visualbell " instead of beep on error...
set laststatus=2   " Always show the statusline
set scrolloff=5    "Start scrolling when we're 5 lines away from margin
set sidescrolloff=15
set sidescroll=1
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set number relativenumber

" vim:tw=78:ts=4:ft=vim:norl:
