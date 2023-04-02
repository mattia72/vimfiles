"=============================================================================
" File:          vscode.vimrc
" Author:        Mattia72 
" Description:   settings for Visual Studio Code   
" Created:       21 okt. 2015
"=============================================================================

" let s:minimal = 1  

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
"xnoremap <leader>sr :<C-u>call <SID>showQuickReplace()<CR> " doesn't work 
"nnoremap <leader>sr :<C-u>call VSCodeNotify('editor.action.startFindReplaceAction', { 'query': expand('<cword>')})<CR>
"
" find word under cursor in files
nnoremap <leader>fA :<C-u>call VSCodeNotify('workbench.action.findInFiles',{ 'query': expand('<cword>')})<CR>
"nnoremap <leader>sR :<C-u>call VSCodeNotify('workbench.action.ReplaceInFiles')<CR> " doesn't work 
" close active editor
nnoremap <leader>wq :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

xnoremap <silent> <C-P> <Cmd>call <SID>showCommands()<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

" Keep undo/redo lists in sync with VSCode
nnoremap <silent> u <Cmd>call VSCodeNotify('undo')<CR>
nnoremap <silent> <C-r> <Cmd>call VSCodeNotify('redo')<CR>
"-------------------------------------------------------------------------------
" Plugins ...
"-------------------------------------------------------------------------------

if !exists('g:init_root_dir') 
  let g:init_root_dir=getenv('XDG_CONFIG_HOME').'/nvim/'
endif
exec 'cd '.g:init_root_dir

if exists('s:minimal') 
  finish
endif

lua << EOF
local packer = require('packer')
local util = require('utils')
local packer_compile_path = util.join_path(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua')

packer.init ({
  compile_path = packer_compile_path
})

packer.startup({ 
  function(use) 
  -- nothing to do 
  end
  })

if util.ispath(packer_compile_path) then
  require('packer_compiled')
end

-- cutlass corrections
vim.keymap.set('n' , 'x'  , 'd'  , {desc= 'Move text to yank'})
vim.keymap.set('x' , 'x'  , 'd'  , {desc= 'Move text to yank'})
vim.keymap.set('n' , 'xx' , 'dd' , {desc= 'Move line to yank'})
vim.keymap.set('n' , 'X'  , 'D'  , {desc= 'Move text until eol to yank'})

-- copy to clipboard
vim.keymap.set('v' , '<leader>y' , "\"+y<cmd>echo 'yanked to clipboard'<cr>" , {desc = 'Copy selected text to the clipboard'})
vim.keymap.set('n' , '<leader>Y' , "\"+y<cmd>echo 'yanked to clipboard'<cr>" , {desc = 'Copy selected text to the clipboard'})

vim.keymap.set('n' , '<leader>p' , '"+p' , {desc = 'Paste text from the clipboard'})
vim.keymap.set('v' , '<leader>p' , '"+p' , {desc = 'Paste text from the clipboard'})

EOF
