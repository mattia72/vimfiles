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

" avoid reload on save
"let g:vimrc_auto_load_disabled = 1
if exists("g:vimrc_auto_load_disabled")
  finish
endif

let g:load_init_lua_only = 1
if exists("g:load_init_lua_only")
  lua require('init_vim')
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

source common.vim
source settings.vimrc
source shell.vim

if !exists('g:vscode') 
  source autocmds.vimrc
endif

if has('nvim') 
  lua require('packer-nvim')
else
  source vimplug.vimrc
endif
source mappings.vimrc

" gui_running is 0 in neovim so we source gui settings from ginit.vim
if has('gui_running') && !has('nvim') 
  source gui_settings.vimrc
endif

source colors.vimrc

if !exists('g:vscode') 
" for vim syntax plugin development and view handling etc.
  source additions.vimrc
endif

set path+=~
cd ~

"-------------------------------------------------------------------------------
" Temporary things...
"-------------------------------------------------------------------------------

set path+=~/dev/vim/**

"let fname = resolve(expand('<sfile>:t'))
EchoModeMsg vimrc 'current directory:' . getcwd()

":so Session.vim
" Obsession takes care of Session update

"" the following trick avoids the "Press RETURN ..." prompt
"0 append
".

" vim:tw=78:ts=4:ft=vim:norl:
