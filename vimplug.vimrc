" File: vimplug.vimrc
" Author: Mattia72
" Description: Plugin handling section
" Last Modified: 09.03.2019

function! s:plug_condition(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin(expand('$XDG_CONFIG_HOME/nvim/plugged/'))

" Run :PlugUpgrade for upgrade Plug itself
Plug 'junegunn/vim-plug'

Plug 'folke/which-key.nvim'   "*
Plug 'ryanoasis/vim-devicons'

"This is deprecated, see Shugo/deoplete.vim instead...
"Plug 'Shougo/neocomplete.vim'     , s:plug_condition(!has('python3') ) " && !has('nvim'))   a fast complete for lua supported vim
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"Plug 'vifm/vifm.vim'            " vifm in vim
"
if has('nvim') 
  "Plug 'glepnir/dashboard-nvim'  " startup screen
  Plug 'goolord/alpha-nvim'  " startup screen
else
  Plug 'mhinz/vim-startify'       " startup screen
endif

"Plug 'neomake/neomake'         " async make
"Plug 'tpope/vim-dispatch'      " async make :Make! and :Copen
"Plug 'hauleth/asyncdo.vim'      " minimal async task runner (no support since 2018)
Plug 'skywind3000/asyncrun.vim' " async external command execution

Plug 'chrisbra/histwin.vim'       " browse undo-tree
Plug 'qpkorr/vim-bufkill'         " delete buffer without closing window :BD, BW, BF, BB

Plug 'itchyny/lightline.vim'
Plug 'itchyny/lightline-powerful'
Plug 'albertomontesg/lightline-asyncrun'

Plug 'scrooloose/nerdtree'       , {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'

Plug 'andymass/vim-matchup'      " modern matchit and matchparen replacement, even better % navigate and highlight matching words

"Plug 'tpope/vim-unimpaired'     " maps :next, :prev etc. 
Plug 'tpope/vim-repeat'          " repeats plugin mappings
Plug 'tpope/vim-abolish'         , { 'on' : 'S' } " :%S/facilit{y, ies}/building{, s}/g
Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'        " git wrapper
Plug 'tpope/vim-obsession'       " updates sessions created by mksession

Plug 'Lokaltog/vim-easymotion'   " ,,w
Plug 'kshenoy/vim-signature'     " toggle, display and navigate marks

" Plug 'dhruvasagar/vim-table-mode' , { 'on' : 'Tableize' }          " creating tables
Plug 'godlygeek/tabular'          , { 'on' : 'Tabularize' }        " creating tables

"Plug 'kien/rainbow_parentheses.vim',{ 'on' : 'RainbowParenthesesToggle' }
Plug 'luochen1990/rainbow'       " better rainbow
Plug 'Konfekt/FastFold'          " it updates folding only if necessary
Plug 'kopischke/vim-stay'        " automated view creation 
Plug 'Raimondi/delimitMate'      " this plugin provides automatic closing of quotes
Plug 'tommcdo/vim-exchange'      " exchange text by operator cx

" Plug 'ludovicchabant/vim-gutentags', s:plug_condition(executable('ctags')) " Automated tag generation and syntax highlighting in Vim
" Plug 'c0r73x/neotags.nvim', s:plug_condition(executable('ctags')) " Automated tag generation and syntax highlighting in Vim
Plug 'jsfaint/gen_tags.vim'
Plug 'vim-scripts/taglist.vim'   " TList browser

Plug 'vim-utils/vim-husk'        " command line mappings like ctrl right
Plug 'justinmk/vim-sneak'        " s<char><char> than ; or s to the next
Plug 'wellle/targets.vim'        " more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)
Plug 'mileszs/ack.vim'           " the better grep
Plug 'yssl/QFEnter'              " QFEnter allows you to open items from quickfix or location list wherever you wish.

"Plug 'adah1972/vim-copy-as-rtf'  " Vim plugin for copying syntax highlighted code as RTF on Windows/macOS/X11

" languages
Plug 'vim-scripts/xml.vim'          , {'for': ['xml']}
Plug 'vim-scripts/perl-support.vim' , {'for': ['perl']}
"Plug 'kchmck/vim-coffee-script'    , {'for': ['coffe']}
"Plug 'zigford/vim-powershell'       , {'for': ['ps1', 'psm1']}
Plug 'PProvost/vim-ps1'             , {'for': ['ps1', 'psm1']}
" Plug 'vim-scripts/MatchTag'       , {'for': ['html']}                " highlight html tag pairs
Plug 'euclidianAce/BetterLua.vim'    , {'for': ['lua']}

if has('nvim')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'rmagatti/auto-session'
  Plug 'rmagatti/session-lens'
else
  " if Telescope breaks...
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'chengzeyi/fzf-preview.vim'
endif

if has('nvim')
  " nvim Syntax lightligth
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

" TODO: jump between delphi functions
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-CountJump'

" development
Plug 'vim-scripts/genutils'
Plug 'albfan/vim-breakpts'
Plug 'h1mesuke/vim-unittest'
Plug 'vim-scripts/Decho'

" My own plugins
"Plug 'mattia72/vim-abinitio' , { 'for': ['abinitio' ] }

Plug  '~\dev\vim\vim-delphi'
Plug  '~\dev\vim\vim-ripgrep'
Plug  '~\dev\vim\vim-copy-as-rtf'

" colors
"Plug 'sjl/badwolf'                        " {'script_type': 'color'}
"Plug 'dsolstad/vim-wombat256i'            " {'script_type': 'color'}
"Plug 'bronzehedwick/impactjs-colorscheme' " {'script_type': 'color'}
"Plug 'altercation/vim-colors-solarized'   " {'script_type': 'color'}
"Plug 'tomasr/molokai'                     " {'script_type': 'color'}
"Plug 'tomasiser/vim-code-dark'            " {'script_type': 'color'}
"Plug 'sickill/vim-monokai'                " {'script_type': 'color'}

call plug#end()

"-------------------------------------------------------------------------------
" Plugin settings
"-------------------------------------------------------------------------------

"UnitTest
nnoremap <leader>su :wa <bar> UnitTest<CR>
nnoremap <F5> :wa <bar> UnitTest<CR>


" Startify: start screen settings
"
if exists('g:startify_session_sort')
  let g:startify_session_sort = 1
  let g:startify_fortune_use_unicode = 1
  let g:startify_session_persistence = 1
  let s:intro = split(execute('version'), '\(\n\|(\|)\)')
  let s:end_index = has('nvim') ? 2 : 3
  let g:startify_custom_header =
        \ startify#pad(startify#fortune#boxed(s:intro[0:s:end_index]))
  let g:startify_commands = [
        \ ':ec "FAQ    " | help my-faq.txt',
        \ ':ec "Delphi " | so ~\delphi-dev.vim | so ~\Session.vim ',
        \ ':ec "vim-ripgrep" | so ~\dev\vim\vim-ripgrep\Session.vim',
        \ ':ec "vim-delphi" | so ~\dev\vim\vim-delphi\Session.vim',
        \ ]
  let g:startify_lists = [
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ ]
end

"switch off fugitive
"let g:loaded_fugitive = 0

" switch off gentags
let g:loaded_gentags#gtags = 1

" This is for taglist
let Tlist_Inc_Winwidth = 0
" switch TagList window on / off
nnoremap <leader>tl :TlistToggle<CR>

" NerdTree (file tree)
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" Histwin (undo tree)
nnoremap <leader>hw :Histwin<CR>
nnoremap <leader>ut :Histwin<CR>

" Rainbow braces highlight
let g:rainbow_active = 0 "1/ 0 if you want to enable it later via :RainbowToggle
nnoremap <leader>rt :RainbowToggle<CR>

let g:xml_syntax_folding = 1

" EasyMotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

if(has('nvim') || has('lua')) && exists('g:loaded_neocomplete')
  " NeoComplete settings in separate file...
  if filereadable("neocomplete.vimrc")
    source neocomplete.vimrc
  endif
else
  let g:neocomplete#enable_at_startup = 0
endif

" NeoSnippets
let g:snippet_author='Mattia72'
let g:neosnippet#snippets_directory ='snippets'
"\.',~/.vim/neobundle/neosnippet-snippets/neosnippets'

" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets' behavior.
imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

if filereadable("lightline.vimrc")
  source lightline.vimrc
endif


if !(has('nvim') || has('lua'))
  finish
endif

" --------------------------------------------
" Lua stuff 
" --------------------------------------------

lua <<EOF

-- more in mappings.vimrc
  local wk = require("which-key")
  wk.setup { 
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
  }
  
-- --------------------------------------------
-- Autosession 
-- --------------------------------------------
  require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = {"/"},
    auto_session_enabled=true, -- alpha/dashboard won't shown, if ~ has a session
    auto_save_enabled=false,
    auto_restore_enabled=true,
  }
  -- command aliases for 
  vim.cmd([[
    command AutoSaveSession SaveSession  
    command AutoRestoreSession RestoreSession 
    command AutoDeleteSession DeleteSession 
  ]])

-- --------------------------------------------
-- BufKill 
-- --------------------------------------------
  wk.register({ ["<leader>b"] = { name = "+bufkill" }, -- optional group name
    ["<leader>bk"]  = { "<cmd>BD<cr>"           , "Delete Buffer"                  , noremap = true } ,
    ["<leader>bka"] = { "<cmd>bufdo BD<cr>"     , "Delete All Buffer"              , noremap = true } ,
    ["<leader>bp"]  = { "<cmd>BB<cr>"           , "Previous Buffer"                , noremap = true } ,
    ["<leader>bn"]  = { "<cmd>BF<cr>"           , "Next Buffer"                    , noremap = true } ,
    ["<leader>bc"]  = { "<cmd>ls<cr>:b<space>"  , "Buffer Change (with tab compl)" , noremap = true } ,
    ["<leader>bs"]  = { "<cmd>ls<cr>:sb<space>" , "Buffer Split (with tab compl)"  , noremap = true } ,
  })

-- --------------------------------------------
-- Telescope 
-- --------------------------------------------
  if vim.fn.filereadable('lua/telescope-nvim.lua') == 1 then
    require('telescope-nvim')
  end

  wk.register({ 
    ["<leader>t"] = { name = "+telescope" }, -- optional group name
    --a = { function() require('telescope.builtin').grep_string({use_regex=true}) end, "Telescope Grep String Under Cursor" , noremap=true } ,
    ["<leader>tf"] = { "<cmd>Telescope find_files<cr>"                                         , "Telescope Find File"            , noremap=true }           ,
    ["<leader>tr"] = { "<cmd>Telescope oldfiles<cr>"                                           , "Telescope Open Recent File"     , noremap=true }           ,
    ["<leader>ta"] = { "<cmd>Telescope marks<cr>"                                              , "Telescope Browse Bookmarks"     , noremap=true }           ,
    ["<leader>tb"] = { function() require('telescope.builtin').buffers({sort_mru=true, ignore_current_buffer=true}) end , "Telescope Open Buffers" , noremap=true } ,
    ["<leader>tg"] = { function() require('telescope.builtin').live_grep({use_regex=true}) end , "Telescope Live Grep"            , noremap=true }           ,
    ["<leader>th"] = { "<cmd>Telescope help_tags<cr>"                                          , "Telescope Help"                 , noremap=true }           ,
    ["<leader>tm"] = { function() require('telescope.builtin').keymaps()        end            , "Telescope Mappings"             , noremap=true }           ,
    ["<leader>ts"] = { function() require('session-lens').search_session()      end            , "Telescope Sessions"             , noremap=true }           ,
  })
-- --------------------------------------------
-- Dashboard
-- --------------------------------------------
  if vim.fn.filereadable('lua/dashboard-nvim.lua') == 1 then
    --require('dashboard-nvim')
  end

-- --------------------------------------------
-- alpha
-- --------------------------------------------
  if vim.fn.filereadable('lua/alpha-nvim.lua') == 1 then
    require('alpha-nvim')
  end
  
--  require('nvim-treesitter.parsers').filetype_to_parsername["delphi"]="pascal" 
  require('nvim-treesitter.configs').setup {
    ensure_installed = {"pascal"}, --, "c", "lua", "rust" }, -- A list of parser names, or "all"
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = true, -- Automatically install missing parsers when entering buffer -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    ignore_install = {}, -- List of parsers to ignore installing (for "all")
    highlight = {
      enable = true, -- `false` will disable the whole extension

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      disable = { "c", "rust" },
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      -- disable = function(lang, buf)
        --   local max_filesize = 100 * 1024 -- 100 KB
        --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --   if ok and stats and stats.size > max_filesize then
        --     return true
        --   end
        --   end,
      additional_vim_regex_highlighting = false,
  },
}
  -- EOF must NOT preceeded and ended with white space
  -- after this line syntax highlight won't work :(
EOF

