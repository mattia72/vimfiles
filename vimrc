"=============================================================================
" File:          vimrc
" Author:        Mattia72
" Description:   Central VIMrc file
" Created:       21 okt. 2015
" Project Repo:  https://github.com/Mattia72/vimfiles
"=============================================================================

" Hint: create ~/_vimrc with this content 'source <path_to_this_file>'
"       create $XDG_CONFIG_HOME/nvim/init.vim with this content 'source <path_to_this_file>'
"       create $XDG_CONFIG_HOME/nvim/ginit.vim with this content 'source <path to gui_settings.vimrc>'

"run this to avoid reload on save
"let g:vimrc_auto_load_disabled = 1
if exists("g:vimrc_auto_load_disabled")
  finish
endif

language en_us

" This must be first, because it changes other options as a side effect.
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

if !exists('g:init_root_dir') 
  let g:init_root_dir=getenv('XDG_CONFIG_HOME').'/nvim/'
endif
exec 'cd '.g:init_root_dir

if exists('g:vscode') 
  if filereadable('vscode.vimrc')
    source vscode.vimrc
  endif
  finish
endif

source settings.vimrc
source mappings.vimrc
source autocmds.vimrc
source vimplug.vimrc
source colors.vimrc

" gui_running is 0 in neovim so we source gui settings from ginit.vim
if has('gui_running') && !has('nvim') 
  source gui_settings.vimrc
endif

" for vim syntax plugin development and view handling etc.
source additions.vimrc

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
