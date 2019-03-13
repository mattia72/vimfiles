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

Plug 'Shougo/denite.nvim' , Cond(has('python3'))
Plug 'Shougo/unite.vim'   , Cond(!has('python3'))

Plug 'Shougo/neomru.vim'          " most recent file list for Unit
Plug 'Shougo/unite-outline', Cond(!has('python3')) " it is only for Unite
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'Shougo/neocomplete.vim'     " a fast complete for lua supported vim
Plug 'chrisbra/histwin.vim'       " browse undo-tree

Plug 'itchyny/lightline.vim'
Plug 'itchyny/lightline-powerful'

" lazy load on command executed
Plug 'scrooloose/nerdtree'       , {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'

Plug 'andymass/vim-matchup'      " modern matchit and matchparen replacement, even better % navigate and highlight matching words

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'          " repeats plugin mappings
Plug 'tpope/vim-abolish'         " :%S/facilit{y, ies}/building{, s}/g
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'        , { 'on' : 'Gstatus'} " git wrapper
Plug 'tpope/vim-obsession'

Plug 'Lokaltog/vim-easymotion'   " ,,w
Plug 'kshenoy/vim-signature'     " toggle, display and navigate marks

Plug 'dhruvasagar/vim-table-mode' , { 'on' : 'Tableize' }          " creating tables
Plug 'godlygeek/tabular'          , { 'on' : 'Tabularize' }        " creating tables

Plug 'kien/rainbow_parentheses.vim',{ 'on' : 'RainbowParenthesesToggle' }
Plug 'Konfekt/FastFold'          " it updates folding only if necessary
Plug 'kopischke/vim-stay'        " automated view creation 
Plug 'Raimondi/delimitMate'      " this plugin provides automatic closing of quotes
Plug 'tommcdo/vim-exchange'      " exchange text by operator cx

" Plug 'ludovicchabant/vim-gutentags', Cond(executable('ctags')) " Automated tag generation and syntax highlighting in Vim
"Plug 'c0r73x/neotags.nvim', Cond(executable('ctags')) " Automated tag generation and syntax highlighting in Vim
Plug 'jsfaint/gen_tags.vim'
Plug 'vim-scripts/taglist.vim'   " TList browser

Plug 'vim-utils/vim-husk'        " command line mappings like ctrl right
Plug 'justinmk/vim-sneak'        " s<char><char> than ; or s to the next
Plug 'wellle/targets.vim'        " more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)
Plug 'mileszs/ack.vim'           " the better grep

" languages
Plug 'vim-scripts/xml.vim'          , {'for': ['xml']}
Plug 'vim-scripts/perl-support.vim' , {'for': ['perl']}
Plug 'kchmck/vim-coffee-script'     , {'for': ['coffe']}
Plug 'PProvost/vim-ps1'             , {'for': ['ps1']}
Plug 'vim-scripts/MatchTag'         , {'for': ['html']}                " highlight html tag pairs

"Plug 'mattia72/vim-abinitio' , { 'for': ['abinitio' ] }
"
" Plug 'https://www.vim.org/scripts/download_script.php?src_id=12923', {'for': ['pascal']}
" TODO: put it in a plugin!!! on github

Plug  '~\de\vim\delphi-syntax'
" Plug 'rkennedy/vim-delphi', {'for': ['delphi']} 
" builtin is better?
let pascal_delphi=1
let pascal_symbol_operator=0
let pascal_one_line_string=1
let pascal_no_tabs=0        " no effect: Error in syntax file in pascal.vim

" colors
Plug 'sjl/badwolf'                        " {'script_type': 'color'}
Plug 'dsolstad/vim-wombat256i'            " {'script_type': 'color'}
Plug 'bronzehedwick/impactjs-colorscheme' " {'script_type': 'color'}
Plug 'altercation/vim-colors-solarized'   " {'script_type': 'color'}
Plug 'tomasr/molokai'                     " {'script_type': 'color'}
Plug 'sickill/vim-monokai'                " {'script_type': 'color'}
Plug 'jnurmine/Zenburn'                   " {'script_type': 'color'}

call plug#end()

"-------------------------------------------------------------------------------
" Plugin settings
"-------------------------------------------------------------------------------

"switch off fugitive
let g:loaded_fugitive = 1

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
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

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


if has('python3') " exists('g:loaded_denite') doesn't work here :(
  " Ctrl-t/g up/down in the list Ctrl-o->normale mode

  " C-a put result to quickfix window
  call denite#custom#map('normal', '<C-a>',
        \ '<denite:multiple_mappings:denite:toggle_select_all'.
        \ ',denite:do_action:quickfix>', 'noremap')

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
  nnoremap <leader>dr :<C-u>Denite -buffer-name=mru     file_mru -mode=normal <cr>
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
