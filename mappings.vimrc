"=============================================================================
" File:          mappings.vimrc
" Author:        Mattia72 
" Description:   Key binding definitions for VIM
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Mappings ...
"-------------------------------------------------------------------------------

let s:fname = resolve(expand('<sfile>:t'))

inoremap <C-Del> <BS>
nnoremap <C-Del> <BS>

"Ctrl-C, Ctrl-V and so on...
source $VIMRUNTIME/mswin.vim
" remap old C-V in normal mode
nnoremap <C-V> <C-Q>

" Auto indent pasted text
if ! has('nvim') 
  nnoremap p p=`]<C-o>
  nnoremap P P=`]<C-o>
endif

" Don't use Ex mode, use Q for paragraph formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" With a noremap leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Copy full path or file name to clipboard
nnoremap <leader>cp :let @+ = expand("%:p")<cr>:EchoModeMsg mappings Path of current file was copied to clipboard.<CR>
nnoremap <leader>cf :let @+ = expand("%:t")<cr>:EchoModeMsg mappings Name of current file was copied to clipboard.<CR>

"got to dir of current file in current window only
nnoremap <leader>cd <ESC>:lcd %:p:h <bar> pwd <CR>

" simple buffer explorer, after :sb works tab completition 
" sb tries to find buffer in opened windows and switches to it
"nnoremap <leader>sb :ls<cr>:sb<space>
" simple buffer explorer, after :b works tab completition 
"nnoremap <leader>be :ls<cr>:b<space>

" same as above with split, if not open
nnoremap <leader>vb :ls<cr>:vertical sb<space>
nnoremap <leader>hb :ls<cr>:sb<space>
" run selected as cmd
vnoremap <leader>rs <ESC>y:<C-R>0

" Fast saving
"nnoremap <leader>s :w!<cr>
" Window operation
nnoremap <leader>w <C-W>
if has('nvim')                 " tnoremap stands for terminal mode mappings in neovim
  tnoremap <Esc> <C-\><C-n>   
  tnoremap <c-h> <C-\><C-N><C-w>h
  tnoremap <c-j> <C-\><C-N><C-w>j
  tnoremap <c-k> <C-\><C-N><C-w>k
  tnoremap <c-j> <C-\><C-N><C-w>j
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
  command! -nargs=0 MyPwsh :call MySetPowerShell()|:term
  cabbrev pwsh MyPwsh
  command! -nargs=0 MyCmd :call MySetDefaultShell()|:term
  cabbrev cmd MyCmd
  nnoremap <leader>tt :vsplit<CR><C-W>L:MyPwsh<CR>:MySetDefaultShell<CR>
  nnoremap <leader>tc :vsplit<CR><C-W>L:MyCmd<CR>
endif
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <leader>om :CommandToTab message<cr>

" Diff this with other file
nnoremap <leader>ds :vertical diffsplit 
" Diff this with other 
nnoremap <leader>dt :diffthis<CR>:vnew<CR>
" Diff jumps
if &diff
  nnoremap <leader>dk [c
  nnoremap <leader>dj ]c
endif
" Fast editing of the vimrc
noremap <leader>vi :tabnew! $MYVIMRC<cr>

" jump to tag
nnoremap <leader>jt <C-]>

" find all word under cursor in the current directory
nnoremap <leader>fa <ESC>:RipGrep -w <C-R><C-W> %<Left><Left>
nnoremap <leader>fA <ESC>:RipGrep -w <C-R><C-W> 
" find all selected
vnoremap <leader>fa y<ESC>:RipGrep <C-R>0 %<Left><Left>
vnoremap <leader>fA y<ESC>:RipGrep <C-R>0


" copy selected to clipboard
vnoremap <leader>yy "+y:EchoModeMsg mappings The selected text was copied to clipboard.<CR>
" paste selected to clipboard
nnoremap <leader>pp "+p
vnoremap <leader>pp "+p

" highlight selected
vnoremap <leader>sh y<ESC>:match Error /<C-R>0/ 
"reload syntax
nnoremap <leader>sy :syn off<CR>:syn on<CR>
" habit: edit for other editors
nnoremap <leader>eo :set tw=0 wrap linebreak
" Clear search highlight
nnoremap <leader><space> :noh<cr>
" Folding...
nnoremap <leader>fs :call <SID>MyFoldSyntax()<cr>
"work with an xml..
"nnoremap <leader>xm :setfiletype xml<cr> :call <SID>MyFoldSyntax()<CR>ggVG=
"xml formatting
nnoremap <leader>xf Go<esc>:r ! xmllint --format %<cr>

function! <SID>MyFoldSyntax()
  set foldmethod=syntax
  set foldcolumn=1
  set foldlevel=1
endfunction

nnoremap <leader>fm :set foldmethod=manual<cr>
"
" foldlevel increase/decrease " so works with number prefix
nnoremap <leader>fi :<C-u>let &foldlevel-=(v:count)?(v:count):1<cr>
nnoremap <leader>fd :<C-u>let &foldlevel+=(v:count)?(v:count):1<cr>

nnoremap <leader>fc :call <SID>MyShowFoldIndicatorColumn()<cr>
function! <SID>MyShowFoldIndicatorColumn()
  if &foldcolumn > 0
    set foldcolumn=0
  else
    set foldcolumn=1
  endif
endfunction

" close help window
nnoremap <leader>hq :helpclose <cr>
" close all, except current buffer
nnoremap <leader>ba :w <bar> %bd <bar> e# <bar> bd# <CR>
" Tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab> :tabnext<CR>
noremap <C-S-tab> :tabprevious<CR>
noremap <C-tab> :tabnext<CR>
inoremap <C-S-tab> <esc>:tabprevious<CR>i
inoremap <C-tab> <esc>:tabnext<CR>i
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <esc>:tabnew<CR>        
inoremap <S-Tab> <C-V><Tab>
" Command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
" Move up/down single line with Ctrl+Arrow
nnoremap <C-Up> [e
nnoremap <C-Down> ]e
" Move up/down multiple lines with Ctrl+Arrow
vnoremap <C-Up> [egv
vnoremap <C-Down> ]egv

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" Select all and increment numbers
nnoremap <C-y> <C-a>
nnoremap <C-x> <C-x>
"handled by mswin.vim
"nnoremap <C-A> ggVG 
"

" Helptags should be rebuild if doc changed
nnoremap <leader>ht :Helptags<CR>

" abbreviations
iabbrev <expr> 2dd  strftime("%d.%m.%Y")
iabbrev <expr> 2dm  strftime("%Y.%m.%d")

"open file under cursor in vsplit window

lua <<EOF

local function show_help()
   local file_type = vim.bo.filetype
   local file_loc = vim.fn.expand('%:p')
--   print(string.format('%s %s', fileloc, filetype))
   local file_dir = string.match(file_loc, "(.*[/\\])")
   local config_dir = vim.fn.stdpath('config')
   if file_type == 'vim'  or file_type == 'help' or (file_type =='lua' and string.sub(file_dir, 1, #config_dir) == config_dir ) then
     vim.cmd('h '..vim.fn.expand('<cword>'))
   end
end

vim.cmd [[packadd which-key.nvim]]
local wk = require("which-key")

wk.register({ 
  ["K"]  = {show_help, "Show help on word", {mode = n , noremap = true}},
})

wk.register({ 
  ["<leader>g"]  = {name = "+open file"} , 
-- nnoremap <leader>gf <C-W>vgf<C-W>x
  ["<leader>gf"] = {"<C-W>vgf<C-W>x<C-W>l" , "🚀 Open file under cursor in vsplit" , {mode = 'n' , noremap = true} } ,
})
wk.register({ 
  ["<leader>g"]  = {name = "+open file"} , 
-- vnoremap <leader>gf <C-W>vgf<C-W>x
 ["<leader>gf"] = {"<C-W>vgf<C-W>x<C-W>l"  , "🚀 Open file under cursor in vsplit" , {mode = 'v' , noremap = true} } ,
})

wk.register({ 
  ["<leader>q"]  = {name = "+quickfix"}, 
  ["<leader>ql"] = {"<cmd>cfirst <bar> while 1 <bar> cnext <bar> endwhile <cr>" , "Load all file from quickfix window" , {mode = 'n', noremap = true} } ,
  ["<leader>qc"] = {"<cmd>cclose<cr>" , "Close quickfix window" , {mode = 'n', noremap = true} } ,
})

vim.keymap.set('n', '<leader>sr',[[<esc>:%s/<C-R><C-W>//g<Left><Left><BackSpace>/]], { desc = "Search & replace word under cursor"})
vim.keymap.set('v', '<leader>sr',[[y<esc>:%s/<C-R>0//g<Left><Left><BackSpace>/]], { desc = "Search & replace selected"})
vim.keymap.set('n', '<leader>sR',[[<esc>:%s/\<<C-R><C-W>\>//g<Left><Left><BackSpace>/]], { desc = "Search & replace WORD under cursor"})
vim.keymap.set('n', "<leader>sl", [[<esc>:%s/.*<C-R><C-W>.*//g<Left><Left><BackSpace>/]] ,{desc = "Search & replace line containing word under cursor"} )

vim.keymap.set('n', "<leader>scR" , [[<esc>:%s/\C\<<C-R><C-W>\>//g<Left><Left><BackSpace>/]] ,{desc = "Search & replace WORD under cursor case sensitive"} )
vim.keymap.set('n', "<leader>scr" , [[<esc>:%s/\C<C-R><C-W>//g<Left><Left><BackSpace>/]]     ,{desc = "Search & replace word under cursor case sensitive"}  )     
vim.keymap.set('v', "<leader>scr" , [[y<esc>:%s/\C<C-R>0//g<Left><Left><BackSpace>/]]        ,{desc = "Search & replace selected case sensitive", })
vim.keymap.set('n', "<leader>scl" , [[<esc>:%s/\C.*<C-R><C-W>.*//g<Left><Left><BackSpace>/]] ,{desc = "Search & replace line containing word under cursor case sensitive"}) 

vim.keymap.set('n','<leader>sp', '[s', {desc= 'Spell jump previous error'})
vim.keymap.set('n','<leader>sn', ']s', {desc= 'Spell jump previous error'})

-- autocomplete parenthesis, (brackets) and braces
--inoremap  (  ()<Left>
--inoremap  [  []<Left>
--inoremap  {  {}<Left>
-- surround selected text
vim.keymap.set('v' , '(' , 's()<Esc>P<Right>%' , {desc = 'Surround selected text'})
vim.keymap.set('v' , '[' , 's[]<Esc>P<Right>%' , {desc = 'Surround selected text'})
vim.keymap.set('v' , '{' , 's{}<Esc>P<Right>%' , {desc = 'Surround selected text'})

EOF

