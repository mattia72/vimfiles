" File: vimplug.vimrc
" Author: Mattia72
" Description: Plugin handling section
" Last Modified: 09.03.2019

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin(expand('~/.vim/plugged/'))

" Run :PlugUpgrade for upgrade Plug itself
Plug 'junegunn/vim-plug'

Plug 'Shougo/denite.nvim'         , Cond(has('python3'))

if has('nvim') 
  if has('python3')
    Plug 'Shougo/deoplete.nvim'     ,  { 'do': ':UpdateRemotePlugins' }
  endif
else
  Plug 'Shougo/deoplete.nvim'     , Cond(has('python3'))
  Plug 'roxma/nvim-yarp'          , Cond(has('python3')) " required by denite
  Plug 'roxma/vim-hug-neovim-rpc' , Cond(has('python3')) " required by denite
endif

Plug 'Shougo/unite.vim'           , Cond(!has('python3'))
Plug 'Shougo/neocomplete.vim'     , Cond(!has('python3'))  " a fast complete for lua supported vim

Plug 'vifm/vifm.vim'            " vifm in vim
Plug 'mhinz/vim-startify'       " startup screen

"Plug 'neomake/neomake'         " async make
"Plug 'tpope/vim-dispatch'      " async make :Make! and :Copen
"Plug 'hauleth/asyncdo.vim'      " minimal async task runner (no support since 2018)
Plug 'skywind3000/asyncrun.vim' " async external command execution

Plug 'Shougo/neomru.vim'        " most recent file list for Unit
Plug 'Shougo/unite-outline', Cond(!has('python3')) " it is only for Unite
Plug 'Shougo/neoyank.vim'       " yank register browser for unite/denite
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'chrisbra/histwin.vim'       " browse undo-tree
Plug 'qpkorr/vim-bufkill'         " delete buffer without closing window

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

" languages
Plug 'vim-scripts/xml.vim'          , {'for': ['xml']}
Plug 'vim-scripts/perl-support.vim' , {'for': ['perl']}
"Plug 'kchmck/vim-coffee-script'     , {'for': ['coffe']}
Plug 'PProvost/vim-ps1'             , {'for': ['ps1']}
" Plug 'vim-scripts/MatchTag'         , {'for': ['html']}                " highlight html tag pairs

" development
Plug 'vim-scripts/genutils'
Plug 'albfan/vim-breakpts'
Plug 'h1mesuke/vim-unittest'

" My own plugins
"Plug 'mattia72/vim-abinitio' , { 'for': ['abinitio' ] }
Plug 'vim-scripts/Decho'

Plug  '~\dev\vim\vim-delphi'
Plug  '~\dev\vim\vim-ripgrep'

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
nnoremap <leader><F5> :wa <bar> UnitTest<CR>

" Startify: start screen settings
let g:startify_session_sort = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let s:intro = split(execute('version'), '\(\n\|(\|)\)')
let s:end_index = has('nvim') ? 2 : 3
let g:startify_custom_header =
      \ startify#pad(startify#fortune#boxed(s:intro[0:s:end_index]))
let g:startify_commands = [
      \ ':ec "FAQ    " | help my-faq.txt',
      \ ':ec "Delphi " | so ~\Session.vim | so ~\delphi-dev.vim',
      \ ':ec "RipGrep" | so ~\dev\vim\vim-ripgrep\Session.vim',
      \ ]
let g:startify_lists = [
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

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

"https://github.com/roxma/nvim-yarp#requirements
if has('python3') " exists('g:loaded_denite') doesn't work here :(
  let g:python3_host_prog = 'C:\Python38\python.exe'

	" Define mappings
	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
	  nnoremap <silent><buffer><expr> <CR>
	        \ denite#do_map('do_action')
	  nnoremap <silent><buffer><expr> d
	        \ denite#do_map('do_action', 'delete')
	  nnoremap <silent><buffer><expr> p
	        \ denite#do_map('do_action', 'preview')
	  nnoremap <silent><buffer><expr> q
	        \ denite#do_map('quit')
	  nnoremap <silent><buffer><expr> i
	        \ denite#do_map('open_filter_buffer')
	  nnoremap <silent><buffer><expr> <Space>
	        \ denite#do_map('toggle_select').'j'
	endfunction

	autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	endfunction

  " Ctrl-t/g up/down in the list Ctrl-o->normale mode
  " C-a put result to quickfix window
  "call denite#custom#map('normal', '<C-a>',
        "\ '<denite:multiple_mappings:denite:toggle_select_all'.
        "\ ',denite:do_action:quickfix>', 'noremap')

  if (executable('rg'))
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
          \ ['--hidden', '--vimgrep', '--smart-case'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif

  " grep in current directory
  nnoremap <leader>dg :<C-u>Denite -buffer-name=grep  grep <cr>
  " recursive file search (requres 'ag' or 'find' (not in windows))
  nnoremap <leader>df :<C-u>Denite -buffer-name=files   file/rec  <cr>
  " most recent file list
  nnoremap <leader>dr :<C-u>Denite -buffer-name=mru     file_mru <cr> 
  " navigate in the current buffer
  nnoremap <leader>do :<C-u>Denite -buffer-name=outline outline <cr>
  " yank history
  nnoremap <leader>dy :<C-u>Denite -buffer-name=neoyank neoyank<cr>
  " buffer explorer
  nnoremap <leader>de :<C-u>Denite -buffer-name=buffer  buffer<cr>
  nnoremap <leader>db :<C-u>Denite -buffer-name=buffer  buffer<cr>
  " browse for defined mappings
  nnoremap <leader>dp :<C-u>Denite -buffer-name=mapping  output:'verbose map'<CR>
  " browse messages
  nnoremap <leader>dm :<C-u>Denite -buffer-name=message output:message<CR>
  nnoremap <leader>dh :<C-u>Denite -buffer-name=help help <CR>

else " if exists('g:loaded_unite')

  let g:unite_source_history_yank_enable = 1
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
  nnoremap <leader>ub :<C-u>Unite -buffer-name=buffer -start-insert buffer<cr>
  " browse for defined mappings
  nnoremap <leader>up :<C-u>Unite -buffer-name=mapping  mapping<CR>
  " browse messages
  nnoremap <leader>um :<C-u>Unite output:message<CR>

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

" Airline
function! MySetAirLine()
  set encoding=utf8

  " set guifont is GuiFont in nvim...
  "  set guifont=Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
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
  let g:asyncrun_status = "stopped" 
  let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
endfunction

" lightline
function! MySetLightLine()
  set encoding=utf8
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set noshowmode
  nnoremap <leader>ll :LightlineReload<cr>

  let g:lightline = {
        \'colorscheme': 'powerline',
        \'separator' : { 'left': '⮀', 'right': '⮂' },
	      \'subseparator' : { 'left': '⮁', 'right': '⮃' },
		    \'component': {
		    \   'lineinfo': '⭡ %3l:%-2v',
		    \ },
		    \'component_function': {
		    \   'readonly': 'LightlineReadonly',
		    \   'fugitive': 'LightlineFugitive',
		    \ }
	      \}

  let g:lightline.component_expand = {
        \ 'asyncrun_status': 'lightline#asyncrun#status',
        \ }

  let g:lightline.active = {
        \ 'right': [
        \	  ['percent', 'lineinfo'],
        \	  ['fileformat', 'fileencoding', 'filetype'],
        \   ['asyncrun_status']
        \ ]}
endfunction

function! LightlineReadonly()
	return &readonly ? '⭤' : ''
endfunction

function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? '⭠ '.branch : ''
	endif
	return ''
endfunction

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

call MySetLightLine()
