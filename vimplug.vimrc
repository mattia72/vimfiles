" File: vimplug.vimrc
" Author: Mattia72
" Description: Plugin handling section
" Last Modified: 09.03.2019

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin(expand('$XDG_CONFIG_HOME/nvim/plugged/'))

" Run :PlugUpgrade for upgrade Plug itself
Plug 'junegunn/vim-plug'

Plug 'folke/which-key.nvim'
Plug 'ryanoasis/vim-devicons'

"This is not needed in neovim ...
"Plug 'Shougo/neocomplete.vim'     , Cond(!has('python3') ) " && !has('nvim'))   a fast complete for lua supported vim
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"Plug 'vifm/vifm.vim'            " vifm in vim
"
if has('nvim') 
  Plug 'glepnir/dashboard-nvim'  " startup screen
else
  Plug 'mhinz/vim-startify'       " startup screen
endif

"Plug 'neomake/neomake'         " async make
"Plug 'tpope/vim-dispatch'      " async make :Make! and :Copen
"Plug 'hauleth/asyncdo.vim'      " minimal async task runner (no support since 2018)
Plug 'skywind3000/asyncrun.vim' " async external command execution

Plug 'chrisbra/histwin.vim'       " browse undo-tree
Plug 'qpkorr/vim-bufkill'         " delete buffer without closing window :BD, BW, BF, BB

Plug 'itchyny/lightline.vim'
Plug 'itchyny/lightline-powerful'
Plug 'albertomontesg/lightline-asyncrun'

Plug 'scrooloose/nerdtree'       , {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'

Plug 'andymass/vim-matchup'      " modern matchit and matchparen replacement, even better % navigate and highlight matching words

"Plug 'tpope/vim-unimpaired'     " maps :next, :prev etc. 
Plug 'tpope/vim-repeat'          " repeats plugin mappings
Plug 'tpope/vim-abolish'         , { 'on' : 'S' } " :%S/facilit{y, ies}/building{, s}/g
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'        " git wrapper
Plug 'tpope/vim-obsession'       " updates sessions created by mksession

Plug 'Lokaltog/vim-easymotion'   " ,,w
Plug 'kshenoy/vim-signature'     " toggle, display and navigate marks

" Plug 'dhruvasagar/vim-table-mode' , { 'on' : 'Tableize' }          " creating tables
Plug 'godlygeek/tabular'          , { 'on' : 'Tabularize' }        " creating tables

"Plug 'kien/rainbow_parentheses.vim',{ 'on' : 'RainbowParenthesesToggle' }
Plug 'luochen1990/rainbow'       " better rainbow
Plug 'Konfekt/FastFold'          " it updates folding only if necessary
Plug 'kopischke/vim-stay'        " automated view creation 
Plug 'Raimondi/delimitMate'      " this plugin provides automatic closing of quotes
Plug 'tommcdo/vim-exchange'      " exchange text by operator cx

" Plug 'ludovicchabant/vim-gutentags', Cond(executable('ctags')) " Automated tag generation and syntax highlighting in Vim
" Plug 'c0r73x/neotags.nvim', Cond(executable('ctags')) " Automated tag generation and syntax highlighting in Vim
Plug 'jsfaint/gen_tags.vim'
Plug 'vim-scripts/taglist.vim'   " TList browser

Plug 'vim-utils/vim-husk'        " command line mappings like ctrl right
Plug 'justinmk/vim-sneak'        " s<char><char> than ; or s to the next
Plug 'wellle/targets.vim'        " more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)
Plug 'mileszs/ack.vim'           " the better grep
Plug 'yssl/QFEnter'              " QFEnter allows you to open items from quickfix or location list wherever you wish.

"Plug 'adah1972/vim-copy-as-rtf'  " Vim plugin for copying syntax highlighted code as RTF on Windows/macOS/X11

" languages
Plug 'vim-scripts/xml.vim'          , {'for': ['xml']}
Plug 'vim-scripts/perl-support.vim' , {'for': ['perl']}
"Plug 'kchmck/vim-coffee-script'    , {'for': ['coffe']}
"Plug 'zigford/vim-powershell'       , {'for': ['ps1', 'psm1']}
Plug 'PProvost/vim-ps1'             , {'for': ['ps1', 'psm1']}
" Plug 'vim-scripts/MatchTag'       , {'for': ['html']}                " highlight html tag pairs
Plug 'euclidianAce/BetterLua.vim'    , {'for': ['lua']}

if has('nvim')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
else
  " if Telescope breaks...
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'chengzeyi/fzf-preview.vim'
endif


" TODO: jump between delphi functions
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-CountJump'

" development
Plug 'vim-scripts/genutils'
Plug 'albfan/vim-breakpts'
Plug 'h1mesuke/vim-unittest'
Plug 'vim-scripts/Decho'

" My own plugins
"Plug 'mattia72/vim-abinitio' , { 'for': ['abinitio' ] }

Plug  '~\dev\vim\vim-delphi'
Plug  '~\dev\vim\vim-ripgrep'
Plug  '~\dev\vim\vim-copy-as-rtf'

" colors
"Plug 'sjl/badwolf'                        " {'script_type': 'color'}
"Plug 'dsolstad/vim-wombat256i'            " {'script_type': 'color'}
"Plug 'bronzehedwick/impactjs-colorscheme' " {'script_type': 'color'}
"Plug 'altercation/vim-colors-solarized'   " {'script_type': 'color'}
"Plug 'tomasr/molokai'                     " {'script_type': 'color'}
"Plug 'tomasiser/vim-code-dark'            " {'script_type': 'color'}
"Plug 'sickill/vim-monokai'                " {'script_type': 'color'}

call plug#end()

"-------------------------------------------------------------------------------
" Plugin settings
"-------------------------------------------------------------------------------

"UnitTest
nnoremap <leader>su :wa <bar> UnitTest<CR>
nnoremap <F5> :wa <bar> UnitTest<CR>

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" Startify: start screen settings
if exists('g:startify_session_sort')
  let g:startify_session_sort = 1
  let g:startify_fortune_use_unicode = 1
  let g:startify_session_persistence = 1
  let s:intro = split(execute('version'), '\(\n\|(\|)\)')
  let s:end_index = has('nvim') ? 2 : 3
  let g:startify_custom_header =
        \ startify#pad(startify#fortune#boxed(s:intro[0:s:end_index]))
  let g:startify_commands = [
        \ ':ec "FAQ    " | help my-faq.txt',
        \ ':ec "Delphi " | so ~\delphi-dev.vim | so ~\Session.vim ',
        \ ':ec "vim-ripgrep" | so ~\dev\vim\vim-ripgrep\Session.vim',
        \ ':ec "vim-delphi" | so ~\dev\vim\vim-delphi\Session.vim',
        \ ]
  let g:startify_lists = [
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ ]
end

if has('nvim') || has('lua') 
  if filereadable("./lua/plug-dashboard.lua")
    source  ./lua/plug-dashboard.lua
  endif
  "it works also...
  "lua require('plug-dashboard')
endif

"switch off fugitive
"let g:loaded_fugitive = 0

" switch off gentags
let g:loaded_gentags#gtags = 1

" This is for taglist
let Tlist_Inc_Winwidth = 0
" switch TagList window on / off
nnoremap <leader>tl :TlistToggle<CR>

" NerdTree (file tree)
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" Histwin (undo tree)
nnoremap <leader>hw :Histwin<CR>
nnoremap <leader>ut :Histwin<CR>

" Rainbow braces highlight
let g:rainbow_active = 0 "1/ 0 if you want to enable it later via :RainbowToggle
nnoremap <leader>rt :RainbowToggle<CR>

let g:xml_syntax_folding = 1

" EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

if(has('nvim') || has('lua')) && exists('g:loaded_neocomplete')
  " NeoComplete settings in separate file...
  if filereadable("neocomplete.vimrc")
    source  neocomplete.vimrc
  endif
else
  let g:neocomplete#enable_at_startup = 0
endif

" NeoSnippets
let g:snippet_author='Mattia72'
let g:neosnippet#snippets_directory ='snippets'
"\.',~/.vim/neobundle/neosnippet-snippets/neosnippets'

" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets' behavior.
imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

if filereadable("lightline.vimrc")
  source  lightline.vimrc
endif

" --------------------------------------------
" bufkill 
" --------------------------------------------
" close a buffer :h bufkill
nnoremap <leader>bd :BD <cr>
" delete buffer and close window
nnoremap <leader>wd :bd <cr>
" close all buffer
nnoremap <leader>bda :bufdo BD <cr>
" prev/next buffer  :h bufkill
nnoremap <leader>bp :BB <cr>
nnoremap <leader>bn :BF <cr>

" --------------------------------------------
" Telescope 
" --------------------------------------------
if(has('nvim') || has('lua'))
  if filereadable("lua/plug-telescope.lua")
    exec 'luafile '. "lua/plug-telescope.lua"
  endif
endif


