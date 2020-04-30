
"=============================================================================
" File:          vscode.vimrc
" Author:        Mattia72 
" Description:   settings for Visual Studio Code   
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Mappings ...
"-------------------------------------------------------------------------------

xmap ,c  <Plug>VSCodeCommentary
nmap ,c  <Plug>VSCodeCommentary
omap ,c  <Plug>VSCodeCommentary
nmap ,cc <Plug>VSCodeCommentaryLine

" find word under cursor
nmap ,fa :<C-u>call VSCodeNotify('actions.find')<CR>
" find word under cursor in files
nmap ,fA :<C-u>call VSCodeNotify('workbench.action.findInFiles')<CR>
" close active editor
nmap ,wq :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

"-------------------------------------------------------------------------------
" Plugins ...
"-------------------------------------------------------------------------------

call plug#begin(expand('~/.vim/plugged/'))
" Run :PlugUpgrade for upgrade Plug itself
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'
Plug 'asvetliakov/vim-easymotion'
Plug 'godlygeek/tabular'          , { 'on' : 'Tabularize' } " creating tables
Plug 'justinmk/vim-sneak'         " s<char><char> than ; or s to the next
Plug 'wellle/targets.vim'         " more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)
" Plug  '~\dev\vim\vim-ripgrep'

call plug#end()
