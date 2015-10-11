" Maintainer:  Mattia72              Last change: 2015.09.06
" create ~/_vimrc with the content "source path_to_this_file"

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

if filereadable(expand("~/.vim/neobundle.vimrc"))
  source ~/.vim/neobundle.vimrc
endif

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

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

"snipMate
let g:snippets_dir="~/.vim/snippets/"

"async easytags...
let g:easytags_async=1

" Helptags should be rebuild if doc changed
nnoremap <leader>ht :Helptags<CR>

" help word under cursor
nnoremap <leader>hh K

" NerdTree (file tree)
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" Histwin (undo tree)
nnoremap <leader>ut :Histwin<CR>

" Rainbow braces highlight
nnoremap <leader>rp :RainbowParenthesesToggle<CR>

" This is for taglist
let Tlist_Inc_Winwidth = 0
nnoremap <leader>tl :Tlist<CR>

"XML
let g:xml_syntax_folding = 1

"For Airline
set encoding=utf8
set guifont=Ubuntu\ Mono\ for\ Powerline:h12:cEASTEUROPE
"set guifont=Consolas\ for\ Powerline\ FixedD:h11:cEASTEUROPE
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1

" EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Default action is open in current buffer, Ctrl-t opens in new tab!
" recursive file search
nnoremap <leader>ut :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:! <cr>
" file in current directory
nnoremap <leader>uf :<C-u>Unite -buffer-name=files   -start-insert file <cr>
" most recent file list
nnoremap <leader>ur :<C-u>Unite -buffer-name=mru     -start-insert file_mru <cr>
" navigate between the current buffer
nnoremap <leader>uo :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
" yank history
nnoremap <leader>uy :<C-u>Unite -buffer-name=yank    history/yank<cr>
" buffer explorer
nnoremap <leader>ue :<C-u>Unite -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" vim:tw=78:ts=4:ft=vim:norl:
