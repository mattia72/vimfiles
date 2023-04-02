
vim.opt.autoindent = true     -- automatically set indent of a new line (local to buffer)
vim.opt.smartindent = true    -- do clever autoindenting (local to buffer)
vim.opt.preserveindent = true -- Preserve kind of whitespace when changing indent (local to buffer)
vim.opt.copyindent = true     -- Copy whitespace for indenting from previous line (local to buffer)
vim.opt.smarttab = true       -- a <Tab> in an indent inserts 'shiftwidth' spaces
vim.opt.shiftwidth=2
vim.opt.shiftround = true     -- round to 'shiftwidth' for <<  and  >>
vim.opt.softtabstop=2
vim.opt.tabstop=2
vim.opt.expandtab = true      -- expand <Tab> to spaces in Insert mode (local to buffer)
-- vim.opt.cindent                                                        -- enable specific indenting for C code (local to buffer)
-- vim.opt.cinoptions=                                                    -- options for C-indenting (local to buffer)
-- vim.opt.cinkeys=0{,0},0),:,0#,!^F,o,O,e                                -- keys that trigger C-indenting in Insert mode (local to buffer)
-- vim.opt.cinwords=if,else,while,do,for,switch                           -- list of words that cause more C-indent (local to buffer)
-- vim.opt.indentexpr=GetVimIndent()                                      -- expression used to obtain the indent of a line (local to buffer)
-- vim.opt.indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\ -- keys that trigger indenting with 'indentexpr' in Insert mode (local to buffer)

---------------------------------------------------------------------------------
-- Searching
---------------------------------------------------------------------------------

vim.opt.incsearch = true       -- Find the next match as we type the search
vim.opt.hlsearch = true        -- Highlight searches by default
vim.opt.ignorecase = true      -- Ignore case when searching...
vim.opt.smartcase = true       -- ...unless we type a capital

if vim.fn.executable('rg') then
  vim.cmd('set isfname&') -- vim.opt.isfname to the default
  vim.opt.grepprg='rg --vimgrep --no-heading --smart-case'
else
  vim.opt.grepprg='internal'
end

---------------------------------------------------------------------------------
-- Editing
---------------------------------------------------------------------------------

vim.opt.backspace={ 'indent', 'eol', 'start' }          -- allow backspacing over everything in insert mode
vim.opt.textwidth=78                        -- For all text files set 'textwidth' to 78 characters.
vim.opt.virtualedit='all'
vim.opt.bufhidden='hide'                      -- This option specifies what happens when a buffer is no longer displayed in a window:
vim.opt.formatoptions='tcqronl'
vim.opt.switchbuf={ 'useopen','usetab' }
vim.opt.viewdir=vim.g.init_root_dir..'.view'
vim.opt.viewoptions={'cursor','folds','slash','unix'}
vim.opt.history=50                          -- keep 50 lines of command line history

vim.g.vimsyn_embed = 'l'    -- embed lua
vim.g.vimsyn_folding = 'f' -- fold functions

---------------------------------------------------------------------------------
-- Completition
---------------------------------------------------------------------------------

vim.opt.wildmenu=true
vim.opt.wildmode='full'

---------------------------------------------------------------------------------
-- Jump or find file
---------------------------------------------------------------------------------

--vim.o.isfname='32,38'      -- add space and '&' to filename chars DOESN'T WORK
-- vim.opt.autochdir         -- auto switch to the current file dir
vim.opt.path:append('.')     -- path to use gf - jump to file.
--vim.opt.path+=**           -- path to use by :find anything reqursive
-- let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')
--vim.opt.cdpath:append('./lua/')  --" path to use gf - jump to file.
--vim.o.suffixesadd='.pm,.pl,.lua'

vim.opt.termguicolors  = true

-- In many terminal emulators the mouse works just fine, thus enable it.
if vim.fn.has('mouse') then
  vim.o.mouse='a'
end

if vim.fn.has('gui_running') then
  vim.opt.cursorcolumn = true
  vim.opt.cursorline  = false --Highlight only the screen column of the cursor
else
  vim.opt.cursorcolumn = false
  vim.opt.cursorline  = false --Highlight only the screen column of the cursor
end

vim.cmd [[
  let &guioptions = substitute(&guioptions, "t", "", "g") "For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
  set guioptions+=bh " horizontal scrollbar
  ]]
vim.opt.wrap= false
vim.opt.ruler=true          -- show the cursor position all the time
vim.opt.showcmd=true        -- display incomplete commands
vim.opt.visualbell=true     -- instead of beep on error...
vim.opt.laststatus=2   -- Always show the statusline
vim.opt.scrolloff=5    -- Start scrolling when we're 5 lines away from margin
vim.opt.sidescrolloff=15
vim.opt.sidescroll=1
vim.o.sessionoptions='blank,buffers,curdir,folds,help,tabpages,winsize'
vim.opt.number=true 
vim.opt.relativenumber=true



