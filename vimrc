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

cd ~

" vim:tw=78:ts=4:ft=vim:norl:
