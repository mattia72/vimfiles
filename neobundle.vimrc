" File: neobundle.vimrc
" Author: Mattia72
" Description: Plugin handling section
" Last Modified: október 18, 2015

" -------------------------------------------------------------------------------
"  NeoBundle
"-------------------------------------------------------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/neobundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'L9'

" So Vimproc build calls: mingw32-make -f make_mingw32.mak 
" MinGW install is needed!!!
NeoBundle 'Shougo/vimproc.vim' , {
      \   'build' : {
      \     'windows' : 'tools\\update-dll-mingw', 
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \   }
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'     " most recent file list for Unit
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Shougo/neocomplete.vim' " a fast complete for lua supported vim
NeoBundle 'Shougo/neocomplcache.vim' " slow neocomplete without lua

NeoBundle 'chrisbra/histwin.vim'  " browse undo-tree

NeoBundle 'bling/vim-airline'     " status line

NeoBundle 'scrooloose/nerdtree'   " file tree browser
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'MatchTag'              " highlight html tag pairs

NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/surround.vim'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kshenoy/vim-signature' " toggle, display and navigate marks

NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Raimondi/delimitMate'  " this plugin provides automatic closing of quotes

NeoBundle 'xolox/vim-shell'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'taglist.vim'

NeoBundle 'bruno/vim-husk'        " command line mappings like ctrl right
NeoBundle 'justinmk/vim-sneak'    " s<char><char> than ; or s to the next
NeoBundle 'wellle/targets.vim'    " more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
NeoBundle 'mileszs/ack.vim'       " the better grep

NeoBundleLazy 'xml.vim'
NeoBundleLazy 'vim-scripts/perl-support.vim'
NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundleLazy 'PProvost/vim-ps1'

"DML syntax
NeoBundleLazy 'vim-abinitio'

" colors
NeoBundle 'sjl/badwolf'
NeoBundle 'dsolstad/vim-wombat256i'
NeoBundle 'bronzehedwick/impactjs-colorscheme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'jnurmine/Zenburn'

if !has("gui_running")
  "NeoBundleDisable vim-airline
endif

call neobundle#end()

filetype plugin indent on         " Required!

" Installation check.
NeoBundleCheck



