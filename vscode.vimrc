
"=============================================================================
" File:          vscode.vimrc
" Author:        Mattia72 
" Description:   settings for Visual Studio Code   
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
set shiftround     " round to 'shiftwidth' for                                          " <<                                                                             " and " >> "
set softtabstop=2
set tabstop=2
set expandtab      " expand <Tab> to spaces in Insert mode (local to buffer)

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
set viewdir=$HOME\.vim\view
set viewoptions=cursor,folds,slash,unix
set history=50                          " keep 50 lines of command line history

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
