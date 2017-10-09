"=============================================================================
" File:          vimrc
" Author:        Mattia72
" Description:   Central VIMrc file
" Created:       21 okt. 2015
" Project Repo:  https://github.com/Mattia72/vimfiles
"=============================================================================

" Hint: create ~/_vimrc with this content 'source <path_to_this_file>'

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

if filereadable(expand("~/.vim/dein.vimrc"))
  source ~/.vim/dein.vimrc
endif

"obsolete: dein is used instead of neobundle
"if filereadable(expand("~/.vim/neobundle.vimrc"))
  "source ~/.vim/neobundle.vimrc
"endif

if filereadable(expand("~/.vim/settings.vimrc"))
  source ~/.vim/settings.vimrc
endif

if filereadable(expand("~/.vim/autocmds.vimrc"))
  source ~/.vim/autocmds.vimrc
endif

if filereadable(expand("~/.vim/mappings.vimrc"))
  source ~/.vim/mappings.vimrc
endif

if filereadable(expand("~/.vim/colors.vimrc"))
  source ~/.vim/colors.vimrc
endif

if filereadable(expand("~/.vim/additions.vimrc"))
  source ~/.vim/additions.vimrc
endif

"-------------------------------------------------------------------------------
" Temporary mapings
"-------------------------------------------------------------------------------

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
set guifont=Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
"set guifont=DejaVu\ Sans \Mono:s12
"set guifont=Consolas\ for\ Powerline\ FixedD:h11:cEASTEUROPE
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{ObsessionStatus()}'

" old airline unicode symbols (new symbols uses new patched fonts!)
"let g:airline_left_alt_sep = '»'
let g:airline_left_alt_sep = '⮁'
let g:airline_left_sep = '⮀'
"let g:airline_right_alt_sep = '«'
let g:airline_right_alt_sep = '⮃'
let g:airline_right_sep = '⮂'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.readonly = '⭤'

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
" browse for defined mappings
nnoremap <leader>um :<C-u>Unite -buffer-name=mapping  mapping<CR>
" browse messages
nnoremap <leader>us :<C-u>Unite output:message<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()

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

cd ~

" vim:tw=78:ts=4:ft=vim:norl:
