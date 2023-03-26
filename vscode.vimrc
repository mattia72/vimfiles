
"=============================================================================
" File:          vscode.vimrc
" Author:        Mattia72 
" Description:   settings for Visual Studio Code   
" Created:       21 okt. 2015
"=============================================================================

let s:minimal = 1  
if exists('s:minimal') 
  finish
endif
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

lua << EOF
local packer = require('packer')
local util = require('utils')
local packer_compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua')

packer.init ({
  compile_path = packer_compile_path
})

packer.startup({
  function(use)

    --
    -- Moving helpers with mappings
    --
    use {'ggandor/lightspeed.nvim'} --  s<char><char> or s<char><space>... 
    use {'andymass/vim-matchup'}    -- di% --modern matchit and matchparen replacement, even better % navigate and highlight matching words

    --
    -- Edit helpers with mappings
    --
    use {'tpope/vim-repeat'}                       -- repeats eg. surround mappings
    use {'preservim/nerdcommenter'}                -- ,c<space>
    use {'tpope/vim-surround'}                     -- s
    use {'godlygeek/tabular', cmd ={'Tabularize'}} -- creating tables
    use {'tommcdo/vim-exchange'}                   -- exchange word: cxiw <move> . line: cxx<move>.
    --use {'svermeulen/vim-cutlass'}                 -- x remapped!!!, d doesn't affect yank
    use {'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }
    use {'wellle/targets.vim' }                    -- more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)

    -- 
    -- Filetype helpers
    --
    --use {'vim-scripts/xml.vim'          , ft = {'xml'}}
    --use {'vim-scripts/perl-support.vim' , ft = {'perl'}}
    --use {'kchmck/vim-coffee-script'     , ft = {'coffe'}}
    --use {'PProvost/vim-ps1'             , ft = {'ps1', 'psm1'}}
    --use {'euclidianAce/BetterLua.vim'   , ft = {'lua'}}

    -- 
    -- Search / replace
    --
    -- use {'~/dev/vim/vim-ripgrep'} --    , cmd ={ 'RipGrep'}}

    -- Automatically set up your confiration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end--,
})

-- cutlass corrections
vim.keymap.set('n' , 'x'  , 'd'  , {desc= 'Move text to yank'})
vim.keymap.set('x' , 'x'  , 'd'  , {desc= 'Move text to yank'})
vim.keymap.set('n' , 'xx' , 'dd' , {desc= 'Move line to yank'})
vim.keymap.set('n' , 'X'  , 'D'  , {desc= 'Move text until eol to yank'})

-- copy to clipboard
vim.keymap.set('v' , '<leader>y' , "\"+y<cmd>lua require('utils').notify_info('Mappings', 'The selected text was copied to the clipboard')<cr>" , {desc = 'Copy selected text to the clipboard'})
vim.keymap.set('n' , '<leader>Y' , "\"+yy<cmd>lua require('utils').notify_info('Mappings', 'The active line was copied to the clipboard')<cr>" , {desc = 'Copy selected text to the clipboard'})

vim.keymap.set('n' , '<leader>p' , '"+p' , {desc = 'Paste text from the clipboard'})
vim.keymap.set('v' , '<leader>p' , '"+p' , {desc = 'Paste text from the clipboard'})

if util.ispath(packer_compile_path) then
  require('packer_compiled_for_vscode')
end

EOF
