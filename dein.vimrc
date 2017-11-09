" File: dein.vimrc
" Author: Mattia72
" Description: Plugin handling section
" Last Modified: október 18, 2015

" -------------------------------------------------------------------------------
"  dein
"  :Dein check-update # doesn't work
"  :Dein update       # works :)
"-------------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim/
endif

if dein#load_state(expand('~/.vim/bundle/'))
  call dein#begin(expand('~/.vim/bundle/'))

  " Let dein manage dein?
  call dein#add('Shougo/dein.vim', {'rtp': ''})

  call dein#add('haya14busa/dein-command.vim')
  call dein#add('vim-scripts/L9')

  " So Vimproc build calls: mingw32-make -f make_mingw32.mak 
  " MinGW install is needed!!!

  "check ok
  call dein#add('Shougo/vimproc.vim' , {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make',
    \     'linux' : 'make',
    \     'unix' : 'gmake'
    \    }
    \ })

  call dein#add('Shougo/unite.vim')
  "call dein#add('Shougo/vimshell.vim')       " shell in a Vim window?
  call dein#add('Shougo/neomru.vim')          " most recent file list for Unit
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/neocomplete.vim')     " a fast complete for lua supported vim
  "call dein#add('Shougo/neocomplcache.vim')  " slow neocomplete without lua

  call dein#add('chrisbra/histwin.vim')       " browse undo-tree

  call dein#add('bling/vim-airline' , 
        \{ 'if' : 'has("gui_running")' })     " status line

  " lazy load on command executed
  call dein#add('scrooloose/nerdtree',
        \{'on_cmd': 'NERDTreeToggle'})

  call dein#add('scrooloose/nerdcommenter')

  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-repeat')          " repeats plugin mappings
  call dein#add('tpope/vim-abolish')         " :%S/facilit{y,ies}/building{,s}/g
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive', 
        \ { 'on_cmd' : 'Gstatus',
        \'augroup' : 'fugitive' })           " git wrapper
  call dein#add('tpope/vim-obsession')

  call dein#add('Lokaltog/vim-easymotion')   " ,,w
  call dein#add('kshenoy/vim-signature')     " toggle, display and navigate marks

  call dein#add('dhruvasagar/vim-table-mode', 
        \{ 'on_cmd' : 'Tableize' })          " creating tables
  call dein#add('godlygeek/tabular',     
        \{ 'on_cmd' : 'Tabularize' })        " creating tables

  call dein#add('zirrostig/vim-schlepp')     " block move

  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('Konfekt/FastFold')          " it updates folding only if necessary
  call dein#add('kopischke/vim-stay')        " automated view creation 
  call dein#add('Raimondi/delimitMate')      " this plugin provides automatic closing of quotes
  call dein#add('tommcdo/vim-exchange')      " exchange text by operator cx

  call dein#add('xolox/vim-shell')           " Maximze, Fullscreen (F11)...
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-reload')
  "
  "error: after save + quit vim process remains in processlist
  "call dein#add('xolox/vim-easytags')       " Automated tag generation and syntax highlighting in Vim

  "check ok
  call dein#add('vim-scripts/taglist.vim')   " TList browser

  call dein#add('vim-utils/vim-husk')        " command line mappings like ctrl right
  call dein#add('justinmk/vim-sneak')        " s<char><char> than ; or s to the next
  call dein#add('wellle/targets.vim')        " more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)
  call dein#add('mileszs/ack.vim')           " the better grep)

  call dein#add('vim-scripts/xml.vim', 
        \{'on_ft': ['xml']})
  call dein#add('vim-scripts/perl-support.vim', 
        \{'on_ft': ['perl']}) 
  call dein#add('kchmck/vim-coffee-script', 
        \{'on_ft': ['coffe']}) 
  call dein#add('PProvost/vim-ps1', 
        \{'on_ft': ['ps1']}) 
  call dein#add('vim-scripts/MatchTag', 
        \{'on_ft': ['html']})                " highlight html tag pairs

 "DML syntax
  call dein#add('mattia72/vim-abinitio' , 
        \{ 'on_ft': ['abinitio' ] }) 

 " colors
  call dein#add('sjl/badwolf',
        \{'script_type': 'color'}) 
  call dein#add('dsolstad/vim-wombat256i',
        \{'script_type': 'color'}) 
  call dein#add('bronzehedwick/impactjs-colorscheme',
        \{'script_type': 'color'}) 
  call dein#add('altercation/vim-colors-solarized',
        \{'script_type': 'color'}) 
  call dein#add('tomasr/molokai',
        \{'script_type': 'color'}) 
  call dein#add('jnurmine/Zenburn',
        \{'script_type': 'color'}) 

  call dein#end()
  "call dein#save_state()
endif

filetype plugin indent on         " Required!
syntax enable                     " Required! 

" Update plugins
if dein#check_install()
	call dein#install()
endif

