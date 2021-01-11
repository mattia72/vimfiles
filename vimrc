"=============================================================================
" File:          vimrc
" Author:        Mattia72
" Description:   Central VIMrc file
" Created:       21 okt. 2015
" Project Repo:  https://github.com/Mattia72/vimfiles
"=============================================================================

" Hint: create ~/_vimrc with this content 'source <path_to_this_file>'
"       create ~/.vim/nvim/init.vim with this content 'source <path_to_this_file>'
"       create ~/.vim/nvim/ginit.vim with this content 'source <path to gui_settings.vimrc>'

"run this to avoid reload on save
"let g:vimrc_auto_load_disabled = 1
if exists("g:vimrc_auto_load_disabled")
  finish
endif

" This must be first, because it changes other options as a side effect.
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

if exists('g:vscode') 
  if filereadable("~/.vim/vscode.vimrc")
    source ~/.vim/vscode.vimrc
  endif
  finish
endif

if filereadable(expand("~/.vim/settings.vimrc"))
  source ~/.vim/settings.vimrc
endif

if filereadable(expand("~/.vim/mappings.vimrc"))
  source ~/.vim/mappings.vimrc
endif


if filereadable(expand("~/.vim/autocmds.vimrc"))
  source ~/.vim/autocmds.vimrc
endif

if filereadable(expand("~/.vim/vimplug.vimrc"))
  source ~/.vim/vimplug.vimrc
endif

if filereadable(expand("~/.vim/colors.vimrc"))
  source ~/.vim/colors.vimrc
endif

" gui_running is 0 in neovim so we source gui settings from ginit.vim
if has('gui_running') && !has('nvim') && filereadable(expand("~/.vim/gui_settings.vimrc"))
  source ~/.vim/gui_settings.vimrc
endif

" for vim syntax plugin development and view handling etc.
if filereadable(expand("~/.vim/additions.vimrc"))
  source ~/.vim/additions.vimrc
endif

set path+=~
cd ~

"-------------------------------------------------------------------------------
" Temporary things...
"-------------------------------------------------------------------------------

set path+=~/dev/vim/**

":so Session.vim
" Obsession takes care of Session update

"" the following trick avoids the "Press RETURN ..." prompt
"0 append
".

" vim:tw=78:ts=4:ft=vim:norl:
