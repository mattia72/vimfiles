
"=============================================================================
" File:          vscode.vimrc
" Author:        Mattia72 
" Description:   settings for Visual Studio Code   
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Mappings ...
"-------------------------------------------------------------------------------

" With a noremap leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

function! s:showQuickReplace() " doesn't work :(
  let startPos = getpos("v")
  let endPos = getpos(".")
  call VSCodeNotifyRangePos('editor.action.startFindReplaceAction',startPos[1], endPos[1], startPos[2], endPos[2], 1)
endfunction

function! s:showCommands()
    let startPos = getpos("v")
    let endPos = getpos(".")
    call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
endfunction

function! s:openWhichKeyInVisualMode()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
      let startLine = line("v")
      let endLine = line(".")
      call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
  else
      let startPos = getpos("v")
      let endPos = getpos(".")
      call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
endfunction

" Copy full path or file name to clipboard
nnoremap <leader>cp :let @+ = expand("%:p")<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>

xmap <leader>c  <Plug>VSCodeCommentary
nmap <leader>c  <Plug>VSCodeCommentary
omap <leader>c  <Plug>VSCodeCommentary
nmap <leader>cc <Plug>VSCodeCommentaryLine

" find word under cursor
nnoremap <leader>fa :<C-u>call VSCodeNotify('actions.find', { 'query': expand('<cword>')})<CR>
"nnoremap <leader>sr :<C-u>call VSCodeNotify('actions.find', { 'query': expand('<cword>')})<CR>
xnoremap <leader>sr :<C-u>call <SID>showQuickReplace()<CR>  
"nnoremap <leader>sr :<C-u>call VSCodeNotify('editor.action.startFindReplaceAction', { 'query': expand('<cword>')})<CR>
" find word under cursor in files
nnoremap <leader>fA :<C-u>call VSCodeNotify('workbench.action.findInFiles',{ 'query': expand('<cword>')})<CR>
nnoremap <leader>sR :<C-u>call VSCodeNotify('workbench.action.ReplaceInFiles')<CR>
" close active editor
nnoremap <leader>wq :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

xnoremap <silent> <C-P> <Cmd>call <SID>showCommands()<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>
"-------------------------------------------------------------------------------
" Plugins ...
"-------------------------------------------------------------------------------

if !exists('g:loaded_plug')
  source ~/.vim/autoload/plug.vim
endif

call plug#begin(expand('~/.vim/plugged/'))
" Run :PlugUpgrade for upgrade Plug itself
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'
Plug 'asvetliakov/vim-easymotion'
Plug 'godlygeek/tabular'          , { 'on' : 'Tabularize' } " creating tables
Plug 'justinmk/vim-sneak'         " s<char><char> than ; or s to the next
Plug 'wellle/targets.vim'         " more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)

" languages?
Plug 'vim-scripts/xml.vim'          , {'for': ['xml']}
Plug 'vim-scripts/perl-support.vim' , {'for': ['perl']}
"Plug 'kchmck/vim-coffee-script'    , {'for': ['coffe']}
"Plug 'zigford/vim-powershell'       , {'for': ['ps1', 'psm1']}
Plug 'PProvost/vim-ps1'             , {'for': ['ps1', 'psm1']}
" Plug 'vim-scripts/MatchTag'       , {'for': ['html']}                " highlight html tag pairs
" Plug  '~\dev\vim\vim-ripgrep'

call plug#end()
