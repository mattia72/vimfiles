
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

" So Vimproc build calls:
" mingw32-make -f make_mingw32.mak 
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
NeoBundle 'Shougo/neomru.vim'   "most recent file list for Unit
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache.vim'

NeoBundle 'chrisbra/histwin.vim' "browse undo-tree

NeoBundle 'bling/vim-airline'    "status line

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'MatchTag' "highlight html tag pairs

NeoBundleDisable 'msanders/snipmate.vim'

NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/surround.vim'

NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kshenoy/vim-signature'

NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Raimondi/delimitMate'  " this plugin will autoclose the 

NeoBundle 'xolox/vim-shell'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'taglist.vim'

NeoBundle 'bruno/vim-husk'   " command line mappings like ctrl right
NeoBundle 'justinmk/vim-sneak' " s<char><char> than ; or s to the next

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

call neobundle#end()

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck

