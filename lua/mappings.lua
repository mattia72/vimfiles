
local m = require('mapper')

m.nmap('<leader>ve', '<cmd>tabnew! $MYVIMRC<cr>', { desc = 'Fast editing of vimrc' })
m.nmap('<leader>vi', '<cmd>tabnew! '..vim.g.init_root_dir..'/lua/init_vim.lua<cr>', { desc = 'Fast editing of init.lua' })

-- Select all and increment numbers
m.nmap('<C-kPlus>',  '<C-a>', {remap = false, desc = 'Increment num under cursor'})
m.nmap('<C-kMinus>', '<C-x>', {remap = false, desc = 'Decrement num under cursor'})
-- <C-A>,<C-C>,<C-V> handled by mswin.vim 
vim.cmd 'source $VIMRUNTIME/mswin.vim'
-- remap old C-V in normal mode
m.nmap('<C-V>', '<C-Q>')


m.nmap('<leader>w', '<C-W>', { desc = "Window operation"})

m.tmap('<Esc>', '<C-\\><C-n>'      , { desc='Normal mode in terminal' })
m.tmap('<A-h>', '<C-\\><C-N><C-w>h', { desc='Got to the left window' })
m.tmap('<A-j>', '<C-\\><C-N><C-w>j', { desc='Got to the down window' })
m.tmap('<A-k>', '<C-\\><C-N><C-w>k', { desc='Got to the upper window' })
m.tmap('<A-l>', '<C-\\><C-N><C-w>l', { desc='Got to the right window' })

vim.cmd [[
  source $XDG_CONFIG_HOME/nvim/shell.vim
  command! -nargs=0 MyPwsh :call MySetPowerShell()|:term
  cabbrev pwsh MyPwsh
  command! -nargs=0 MyCmd :call MySetDefaultShell()|:term
  ]]

m.nmap('<leader>tt', '<cmd>vsplit<CR><C-W>L<cmd>MyPwsh<CR><cmd>MySetDefaultShell<CR>', {desc = 'Open pwsh in vsplit'})
m.nmap('<leader>tc', '<cmd>vsplit<CR><C-W>L<cmd>MyCmd<CR>',                            {desc = 'Open cmd in vsplit'})

m.imap('<A-h>', '<C-\\><C-N><C-w>h', {desc = 'Got to the left window' })
m.imap('<A-j>', '<C-\\><C-N><C-w>j', {desc = 'Got to the down window' })
m.imap('<A-k>', '<C-\\><C-N><C-w>k', {desc = 'Got to the upper window'})
m.imap('<A-l>', '<C-\\><C-N><C-w>l', {desc = 'Got to the right window'})
m.nmap('<A-h>', '<C-w>h',            {desc = 'Got to the left window' })
m.nmap('<A-j>', '<C-w>j',            {desc = 'Got to the down window' })
m.nmap('<A-k>', '<C-w>k',            {desc = 'Got to the upper window'})
m.nmap('<A-l>', '<C-w>l',            {desc = 'Got to the right window'})

m.xmap('x', 'd', { desc = 'Move text to yank' })
m.nmap('x', 'd', { desc = 'Move text to yank' })
m.nmap('xx', 'dd', { desc = 'Move line to yank' })
m.nmap('X', 'D', { desc = 'Move text until eol to yank' })

m.nmap('<A-PageDown>', '<cmd>m .+1<CR>==',        {desc="Move line down"})
m.nmap('<A-PageUp>',   '<cmd>m .-2<CR>==',        {desc="Move line up"})
m.imap('<A-PageDown>', '<esc><cmd>m .+1<CR>==gi', {desc="Move line down"})
m.imap('<A-PageUp>',   '<esc><cmd>m .-2<CR>==gi', {desc="Move line up"})
m.vmap('<A-PageDown>', ":m '>+1<CR>gv=gv",        {desc="Move selection down"})
m.vmap('<A-PageUp>',   ":m '<-2<CR>gv=gv",        {desc="Move selection up"})

m.nmap('<leader>hq', '<cmd>helpclose <cr>',                      {desc = 'Close help window'})
m.nmap('<leader>ba', '<cmd>w <bar> %bd <bar> e# <bar> bd# <CR>', {desc = 'Close all, except current buffer'})

--
-- Tab navigation like firefox
--
m.nmap('<C-S-tab>',  '<cmd>tabprevious<CR>',       {desc = 'Go to prev tab'})
m.nmap('<C-tab>',    '<cmd>tabnext<CR>',           {desc = 'Go to next tab'})
m.nmap('<C-S-tab>',  '<cmd>tabprevious<CR>',       {desc = 'Go to prev tab'})
m.nmap('<C-tab>',    '<cmd>tabnext<CR>',           {desc = 'Go to next tab'})
m.imap('<C-S-tab>',  '<esc><cmd>tabprevious<CR>i', {desc = 'Go to prev tab'})
m.imap('<C-tab>',    '<esc><cmd>tabnext<CR>i',     {desc = 'Go to next tab'})
m.nmap('<C-t>',      '<cmd>tabnew<CR>',            {desc = 'New tab'})
m.imap('<C-t>',      '<esc><cmd>tabnew<CR>',       {desc = 'New tab'})
-- Command line
m.cmap('<C-A>',      '<Home>',                     {desc = 'Home'})
m.cmap('<C-E>',      '<End>',                      {desc = 'End'})
m.cmap('<C-N>',      '<Down>',                     {desc = 'Down'})
m.cmap('<C-P>',      '<Up>',                       {desc = 'Up'})

m.nmap('gV',         '`[v`]',                      {desc = 'Visually select the text that was last edited/pasted'})

-- Helptags should be rebuild if doc changed
m.nmap('<leader>ht', '<cmd>Helptags<CR>',          {desc = ''})

-- abbreviations
vim.cmd [[
iabbrev <expr> 2dd  strftime("%d.%m.%Y")
iabbrev <expr> 2dm  strftime("%Y.%m.%d")
]]


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
  ["K"]  = {show_help, "Show help on word", {mode = 'n' , noremap = true}},
})

wk.register({
  ["<leader>g"]  = {name = "+open file"} ,
-- nnoremap <leader>gf <C-W>vgf<C-W>x
  ["<leader>gf"] = {"<C-W>vgf<C-W>x<C-W>l" , "🚀 Open file under cursor in vsplit" , {mode = 'n' , noremap = true} } ,
})

wk.register({
  ["<leader>q"]  = {name = "+quickfix"},
  ["<leader>ql"] = {"<cmd>cfirst <bar> while 1 <bar> cnext <bar> endwhile <cr>" , "Load all file from quickfix window" , {mode = 'n', noremap = true} } ,
  ["<leader>qc"] = {"<cmd>cclose<cr>" , "Close quickfix window" , {mode = 'n', noremap = true} } ,
})

m.nmap('<leader>sr',  [[<esc>:%s/<C-R><C-W>//g<Left><Left><BackSpace>/]],       {desc = "Search & replace word under cursor"})
m.vmap('<leader>sr',  [[y<esc>:%s/<C-R>0//g<Left><Left><BackSpace>/]],          {desc = "Search & replace selected"})
m.nmap('<leader>sR',  [[<esc>:%s/\<<C-R><C-W>\>//g<Left><Left><BackSpace>/]],   {desc = "Search & replace WORD under cursor"})
m.nmap("<leader>sl",  [[<esc>:%s/.*<C-R><C-W>.*//g<Left><Left><BackSpace>/]],   {desc = "Search & replace line containing word under cursor"} )

m.nmap("<leader>scR", [[<esc>:%s/\C\<<C-R><C-W>\>//g<Left><Left><BackSpace>/]], {desc = "Search & replace WORD under cursor case sensitive"} )
m.nmap("<leader>scr", [[<esc>:%s/\C<C-R><C-W>//g<Left><Left><BackSpace>/]],     {desc = "Search & replace word under cursor case sensitive"}  )
m.vmap("<leader>scr", [[y<esc>:%s/\C<C-R>0//g<Left><Left><BackSpace>/]],        {desc = "Search & replace selected case sensitive", })
m.nmap("<leader>scl", [[<esc>:%s/\C.*<C-R><C-W>.*//g<Left><Left><BackSpace>/]], {desc = "Search & replace line containing word under cursor case sensitive"})

m.nmap('<leader>sp',  '[s',                                                     {desc= 'Spell jump previous error'})
m.nmap('<leader>sn',  ']s',                                                     {desc= 'Spell jump previous error'})

-- autocomplete parenthesis, (brackets) and braces
m.vmap('(' , 's()<Esc>P<Right>%' , {desc = 'Surround selected text'})
m.vmap('[' , 's[]<Esc>P<Right>%' , {desc = 'Surround selected text'})
m.vmap('{' , 's{}<Esc>P<Right>%' , {desc = 'Surround selected text'})
m.vmap('<' , 's<><Esc>P<Right>%' , {desc = 'Surround selected text'})

-- copy to clipboard
m.vmap('<leader>y' , "\"+y<cmd>lua require('utils').notify_info('Mappings', 'The selected text was copied to the clipboard')<cr>" , {desc = 'Copy selected text to the clipboard'})
m.nmap('<leader>Y' , "\"+yy<cmd>lua require('utils').notify_info('Mappings', 'The active line was copied to the clipboard')<cr>" , {desc = 'Copy selected text to the clipboard'})

m.nmap('<leader>p' , '"+p' , {desc = 'Paste text from the clipboard'})
m.vmap('<leader>p' , '"+p' , {desc = 'Paste text from the clipboard'})

m.nmap('<leader>ct',      '<cmd>CommandToTab message<cr>',             {desc = 'Command to tab'})
-- jump to tag
m.nmap('<leader>jt',      '<C-]>',                                     {desc = 'Jump to tag'})

-- find all word under cursor in the current directory
m.nmap('<leader>fa',      '<ESC>:RipGrep -w <C-R><C-W> %<Left><Left>', {desc = 'RipGrep word under cursor in actual file'})
m.nmap('<leader>fA',      '<ESC>:RipGrep -w <C-R><C-W> ',              {desc = 'RipGrep word under cursor in current dir'})
-- find all selected
m.vmap('<leader>fa',      '<ESC>:RipGrep <C-R>0 %<Left><Left>',        {desc = 'RipGrep selected in actual file'})
m.vmap('<leader>fA',      '<ESC>:RipGrep <C-R>0',                      {desc = 'RipGrep selected in current dir'})

-- highlight selected
m.vmap('<leader>sh',      '<ESC>:match Error /<C-R>0/ ',               {desc = 'Highlight selected'})
--reload syntax
m.nmap('<leader>sy',      ':syn off<CR>:syn on<CR>',                   {desc = 'Reload syntax'})
-- Clear search highlight
m.nmap('<leader><space>', ':noh<cr>',                                  {desc = 'Clear highlight'})

-- Folding...
--
function MyFoldSyntax()
  vim.opt_local.foldmethod='syntax'
  vim.opt_local.foldcolumn=1
  vim.opt_local.foldlevel=1
end

function MyShowFoldIndicatorColumn()
  if vim.opt_local.foldcolumn > 0 then
    vim.opt_local.foldcolumn=0
  else
    vim.opt_local.foldcolumn=1
  end
end

m.nmap('<leader>fs', function() MyFoldSyntax() end, {desc = 'Set fold method syntax'})
m.nmap('<leader>fm', ':set foldmethod=manual<cr>', {desc = 'Set fold method manual'})
-- foldlevel increase/decrease " so works with number prefix
m.nmap('<leader>fi', ':<C-u>let &foldlevel-=(v:count)?(v:count):1<cr>', {desc = 'Increase fold level'})
m.nmap('<leader>fd', ':<C-u>let &foldlevel+=(v:count)?(v:count):1<cr>', {desc = 'Decrease fold level'})
m.nmap('<leader>fc', function() MyShowFoldIndicatorColumn() end, {desc = 'Show fold indicator'})
