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
  "Prebuild dlls: https://github.com/Shougo/vimproc.vim/releases
  call dein#add('Shougo/vimproc.vim') ", {
"    \ 'build' : {
"    \     'windows' : 'tools\\update-dll-mingw',
"    \     'cygwin' : 'make -f make_cygwin.mak',
"    \     'mac' : 'make',
"    \     'linux' : 'make',
"    \     'unix' : 'gmake'
"    \    }
"    \ })

  call dein#add('Shougo/denite.nvim',
        \{ 'if' : 'has("nvim")' })       
  call dein#add('Shougo/unite.vim',
        \{ 'if' : '!has("nvim")' })     " status line

  "call dein#add('Shougo/vimshell.vim')       " shell in a Vim window?
  call dein#add('Shougo/neomru.vim')          " most recent file list for Unit
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/neocomplete.vim')     " a fast complete for lua supported vim
  "call dein#add('Shougo/neocomplcache.vim')  " slow neocomplete without lua

  call dein#add('chrisbra/histwin.vim')       " browse undo-tree

  "call dein#add('bling/vim-airline', 
  "\{ 'if' : 'has("gui_running") || has("nvim")' })     " status line

  call dein#add('itchyny/lightline.vim')

  " lazy load on command executed
  call dein#add('scrooloose/nerdtree',
        \{'on_cmd': 'NERDTreeToggle'})

  call dein#add('scrooloose/nerdcommenter')

  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-repeat')          " repeats plugin mappings
  call dein#add('tpope/vim-abolish')         " :%S/facilit{y,ies}/building{,s}/g
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')        " git wrapper 
  " { 'on_cmd' : 'Gstatus','augroup' : 'fugitive' })
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
  "call dein#add('mattia72/vim-abinitio' , 
        "\{ 'on_ft': ['abinitio' ] }) 

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
  call dein#save_state()
endif

filetype plugin indent on         " Required!
syntax enable                     " Required! 

if has('vim_starting')
  " I want to install vimproc before installing any other plugins
  if dein#check_install(['vimproc.vim'])
    call dein#install(['vimproc.vim'])
  endif
  if dein#check_install()
    call dein#install()
  endif
endif

"-------------------------------------------------------------------------------
" Plugin settings
"-------------------------------------------------------------------------------

"switch off fugitive
let g:loaded_fugitive = 1

"async easytags...
let g:easytags_async=1
nnoremap <leader>tu :UpdateTags<CR>

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
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

" Matchit help should be copyed to doc directory
runtime macros/matchit.vim


let g:xml_syntax_folding = 1

" Airline
set encoding=utf8
if has('nvim')
  "GuiFont! Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
  "GuiFont DejaVu\ Sans \Mono:s12
  "GuiFont Consolas\ for\ Powerline\ FixedD:h11:cEASTEUROPE
else
  set guifont=Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
  "set guifont=DejaVu\ Sans \Mono:s12
  "set guifont=Consolas\ for\ Powerline\ FixedD:h11:cEASTEUROPE
endif
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{ObsessionStatus()}'

if !has('nvim')
  " old airline unicode symbols (new symbols uses new patched fonts!)
  ""let g:airline_left_alt_sep = '»'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_left_sep = '⮀'
  ""let g:airline_right_alt_sep = '«'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_right_sep = '⮂'
  let g:airline_symbols.linenr = '⭡'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.maxlinenr = '☰'
  let g:airline_symbols.readonly = '⭤'
endif

" EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

if(has('lua'))
  " NeoComplete settings in separate file...
  if filereadable(expand("~/.vim/neocomplete.vimrc"))
    source ~/.vim/neocomplete.vimrc
  endif
else
  let g:neocomplete#enable_at_startup = 0
endif


" NeoSnippets
let g:snippet_author='Mattia72'
let g:neosnippet#snippets_directory ='~/.vim/snippets'
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

vnoremap <up>    <Plug>SchleppUp
vnoremap <down>  <Plug>SchleppDown
vnoremap <left>  <Plug>SchleppLeft
vnoremap <right> <Plug>SchleppRight
vnoremap <S-up>   <Plug>SchleppIndentUp
vnoremap <S-down> <Plug>SchleppIndentDown
vnoremap D  <Plug>SchleppDup
vnoremap Dk <Plug>SchleppDupUp
vnoremap Dj <Plug>SchleppDupDown
vnoremap Dh <Plug>SchleppDupLeft
vnoremap Dl <Plug>SchleppDupRight

" Unite
let g:unite_source_history_yank_enable = 1

if !( has('python3') || has('nvim') )
  call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Default action is open in current buffer,
" !!!! Ctrl-t opens selected in new tab! !!!
"
  " recursive file search (requres 'ag' or 'find' (not in windows))
  "nnoremap <leader>ut :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:! <cr>
  " file in current directory
  nnoremap <leader>uf :<C-u>Unite -buffer-name=files   -start-insert file <cr>
  " most recent file list
  nnoremap <leader>ur :<C-u>Unite -buffer-name=mru     -start-insert file_mru <cr>
  " navigate in the current buffer
  nnoremap <leader>uo :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
  " yank history
  nnoremap <leader>uy :<C-u>Unite -buffer-name=yank    history/yank<cr>
  " buffer explorer
  nnoremap <leader>ue :<C-u>Unite -buffer-name=buffer  buffer<cr>
  nnoremap <leader>ub :<C-u>Unite -buffer-name=buffer  buffer<cr>
  " browse for defined mappings
  nnoremap <leader>um :<C-u>Unite -buffer-name=mapping  mapping<CR>
  " browse messages
  nnoremap <leader>us :<C-u>Unite output:message<CR>

  " Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()
endif

function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  " Reverse sort order on S
  nnoremap <buffer><expr> S      unite#mappings#set_current_sorters(
        \ empty(unite#mappings#get_current_sorters()) ?
        \ ['sorter_reverse'] : [])
  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction

