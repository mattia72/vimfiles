"=============================================================================
" File:          settings.vimrc
" Author:        Mattia72 
" Description:   settings for VIM   
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Indentation 
"-------------------------------------------------------------------------------

set autoindent     " automatically set the indent of a new line (local to buffer)
set smartindent    " do clever autoindenting (local to buffer)
set preserveindent " Preserve kind of whitespace when changing indent (local to buffer)
set copyindent     " Copy whitespace for indenting from previous line (local to buffer)
set smarttab       " a <Tab> in an indent inserts 'shiftwidth' spaces
set shiftwidth=2
set shiftround     " round to 'shiftwidth' for <<  and  >> 
set softtabstop=2
set tabstop=2
set expandtab      " expand <Tab> to spaces in Insert mode (local to buffer)
                   " set cindent                                                        " enable specific indenting for C code (local to buffer)
                   " set cinoptions=                                                    " options for C-indenting (local to buffer)
                   " set cinkeys=0{,0},0),:,0#,!^F,o,O,e                                " keys that trigger C-indenting in Insert mode (local to buffer)
                   " set cinwords=if,else,while,do,for,switch                           " list of words that cause more C-indent (local to buffer)
                   " set indentexpr=GetVimIndent()                                      " expression used to obtain the indent of a line (local to buffer)
                   " set indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\ " keys that trigger indenting with 'indentexpr' in Insert mode (local to buffer)

"-------------------------------------------------------------------------------
" Searching
"-------------------------------------------------------------------------------

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

"echom 'grepprg='.&grepprg
if (executable('rg')) 
  set isfname&      " set isfname to the default
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
else
  set grepprg=internal
endif

"-------------------------------------------------------------------------------
" Editing
"-------------------------------------------------------------------------------

set backspace=indent,eol,start          " allow backspacing over everything in insert mode
set textwidth=78                        " For all text files set 'textwidth' to 78 characters.
set virtualedit=all
set bufhidden=hide                      " This option specifies what happens when a buffer is no longer displayed in a window:
set formatoptions=tcqronl
set switchbuf=useopen,usetab
set viewdir=$XDG_CONFIG_HOME\nvim\.view
set viewoptions=cursor,folds,slash,unix
set history=50                          " keep 50 lines of command line history

let g:vimsyn_embed = 'l'    " embed lua 
let g:vimsyn_folding = 'f' " fold functions

"-------------------------------------------------------------------------------
" Completition
"-------------------------------------------------------------------------------

set wildmenu
set wildmode=full

"-------------------------------------------------------------------------------
" Jump or find file
"-------------------------------------------------------------------------------

set isfname+=32,38      " add space and '&' to filename chars 
						" grepprg, makeprg works only with set isfname-=32   
" set autochdir         " auto switch to the current file dir
set path+=.             " path to use gf - jump to file.
"set path+=**            " path to use by :find anything reqursive
                        " let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')
                        " set cdpath+=.  " path to use gf - jump to file.
set suffixesadd=.pm,.pl

"set shell=C:\\msys32\\usr\\bin\\bash
"let $TMP="c:/tmp"

"-------------------------------------------------------------------------------
" GUI/Terminal
"-------------------------------------------------------------------------------

if has('win32')
  "own directory before the others...^= not +=
  set runtimepath^=$XDG_CONFIG_HOME/nvim
  set runtimepath^=$XDG_CONFIG_HOME/nvim/after
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if !(has('gui_running') || has('nvim'))
  set term=xterm
endif
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_ti.="\e[1 q" " enter termcap mode
let &t_SI.="\e[5 q" " start insert mode
let &t_EI.="\e[4 q" " end insert mode
let &t_te.="\e[0 q" " out of termcap mode

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 
  syntax on
endif

let g:loaded_matchit = 1

if exists('g:fvim_loaded') "Cross platform Neovim front-end UI
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    FVimKeyAltGr v:true
endif

if has('gui_running') 
  set cursorcolumn nocursorline "Highlight only the screen column of the cursor
else
  set nocursorcolumn nocursorline
endif

let &guioptions = substitute(&guioptions, "t", "", "g") "For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
set guioptions+=bh " horizontal scrollbar
set nowrap
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set visualbell     " instead of beep on error...
set laststatus=2   " Always show the statusline
set scrolloff=5    " Start scrolling when we're 5 lines away from margin
set sidescrolloff=15
set sidescroll=1
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set number relativenumber

