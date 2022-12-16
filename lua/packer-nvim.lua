
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- the plugin install follows from here

require('packer').startup({
  function(use)
    -- speed up loading lua modules 
    -- put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    use({"wbthomason/packer.nvim", opt = true})
    -- startup screen
    use {'goolord/alpha-nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = [[require('alpha-nvim')]] }

    --
    -- Telescope
    --
    use {'nvim-telescope/telescope.nvim',  requires = {'nvim-lua/plenary.nvim'},
      config = function() require('telescope-nvim') end,
    }
    use {'nvim-telescope/telescope-project.nvim',  requires = {'nvim-telescope/telescope.nvim'},}
    use {'nvim-telescope/telescope-file-browser.nvim', requires = {'nvim-telescope/telescope.nvim'},}

    --
    -- auto-completion engines
    --
    use {'neoclide/coc.nvim', branch = 'release'}               -- scoop install nodejs | CocInstall coc-vimlsp
    use {'p00f/nvim-ts-rainbow', require={'nvim-treesitter'}}   -- scoop install tree-sitter
    use {'nvim-treesitter/nvim-treesitter', event = 'BufEnter', run = ":TSUpdate", config = [[require('config.nvim-treesitter')]] }
    use {'hrsh7th/nvim-cmp',                                    -- scoop install python
      event = 'InsertEnter',
      opt = true,
      config = function()
        require('config.nvim-cmp').setup()
      end,
      wants = { 'LuaSnip' },
      requires = {
        'neovim/nvim-lspconfig',
        'onsails/lspkind-nvim',
        'hrsh7th/cmp-buffer',    -- nvim-cmp completion sources
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'ray-x/cmp-treesitter',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-calc',
        'f3fora/cmp-spell',
        'hrsh7th/cmp-emoji',
        {
          'L3MON4D3/LuaSnip',
          wants = 'friendly-snippets',
          config = function()
            require('config.luasnip').setup()
          end,
        },
        'rafamadriz/friendly-snippets',
        disable = false,
      },
    }
    use {
      'ms-jpq/coq_nvim',
      --commit = '84ec5fa', --last working commit: https://github.com/ms-jpq/coq_nvim/issues/522
      branch = 'coq',
      event = 'InsertEnter',
      opt = true,
      run = ':COQdeps',
      config = function()
        require('config.coq').setup()
      end,
      requires = {
        { 'ms-jpq/coq.artifacts', branch = "artifacts" },
        { 'ms-jpq/coq.thirdparty', branch = "3p", module = "coq_3p" },
      },
      disable = false,
    }

    --
    -- Gui
    --
    use {"folke/which-key.nvim", event = "VimEnter", -- showing keybindings
      config = function() vim.defer_fn(function() require('config.which-key') end, 2000) end
    }
    use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'} -- eg. :stew: icons for several plugins
    use {'nvim-lualine/lualine.nvim', event = 'VimEnter', config = [[require('config.lualine-nvim')]] }
    use {'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons'}, config = [[require('config.nvim-tree')]]} -- tag = 'nightly' -- optional, updated every week. (see issue #1193) }
    use {'chentoast/marks.nvim', config = [[require('config.marks-nvim')]]}
    use {'rcarriga/nvim-notify'}

    --
    -- Sessions, views
    --
    use {'jedrzejboczar/possession.nvim', requires = { 'nvim-lua/plenary.nvim' },
      config = function() require("config.possession") end
    }
    use {'Shatur/neovim-session-manager', requires = { 'nvim-lua/plenary.nvim' },
      config = function() require("config.neovim-session-manager") end
    }
    use {'zhimsel/vim-stay'} --auto view creation

    --
    -- Git
    --
    use {'tpope/vim-fugitive', cmd={'G'}} -- git wrapper

    --
    -- Moving helpers with mappings
    --
    --use {'Lokaltog/vim-easymotion'} -- ,,w
    --use {'justinmk/vim-sneak'}      -- s<char><char> than ; or s to the next

    use {'ggandor/lightspeed.nvim'} --  s<char><char> or s<char><space>... 

    use {'andymass/vim-matchup'}    -- di% --modern matchit and matchparen replacement, even better % navigate and highlight matching words
    use {'yssl/QFEnter'}            -- QFEnter allows you to open items from quickfix or location list wherever you wish.

    --
    -- Edit helpers with mappings
    --
    use {'tpope/vim-repeat'}                       -- repeats eg. surround mappings
    use {'preservim/nerdcommenter'}                -- ,c<space>
    use {'tpope/vim-surround'}                     -- s
    use {'godlygeek/tabular', cmd ={'Tabularize'}} -- creating tables
    use {'tommcdo/vim-exchange'}                   -- exchange word: cxiw <move> . line: cxx<move>.
    use {'svermeulen/vim-cutlass'}                 -- x remapped!!!, d doesn't affect yank
    use {'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }
    use { 'wellle/targets.vim' }                   -- more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)

    -- 
    -- Search / replace
    --
    use {'mileszs/ack.vim'   , cmd = { 'Ack'}} -- the better grep
    use {'tpope/vim-abolish' , cmd = { 'S'}}   -- :%S/facilit{y , ies}/building{ , s}/g
    use {'nvim-pack/nvim-spectre'}

    -- 
    -- Filetype helpers
    --
    use {'vim-scripts/xml.vim'          , ft = {'xml'}}
    use {'vim-scripts/perl-support.vim' , ft = {'perl'}}
    use {'kchmck/vim-coffee-script'     , ft = {'coffe'}}
    --use {'zigford/vim-powershell'       , ft = {'ps1', 'psm1'}}
    use {'PProvost/vim-ps1'             , ft = {'ps1', 'psm1'}}
    use {'euclidianAce/BetterLua.vim'   , ft = {'lua'}}

    --
    -- Command helpers
    --
    use { 'skywind3000/asyncrun.vim'} --, cmd = { 'AsyncRun' }}
    use {'simnalamburt/vim-mundo', cmd = {'MundoToggle', 'MundoShow'}} -- Show undo history visually
    use {'qpkorr/vim-bufkill'} --cmd = {'BD', 'BB', 'BF', 'BW '}} -- buffer without closing window :BD, BW, BF, BB doesn't work properly if lazy loaded.

    --
    -- My own plugins
    --
    --use  'mattia72/vim-abinitio' , { 'for': ['abinitio' ] }
    use {'~/dev/vim/vim-delphi'     , ft = {'delphi'}}
    use {'~/dev/vim/vim-ripgrep'} --    , cmd ={ 'RipGrep'}}
    use {'~/dev/vim/vim-copy-as-rtf', cmd ={ 'CopyRTF'}}

    use {'vim-scripts/genutils', opt= true}
    use {'albfan/vim-breakpts', require = {'genutils'}, cmd = {'BreakPts' }}
    use {'h1mesuke/vim-unittest', cmd={ 'UnitTest'},
      run = function() vim.cmd([[
        nnoremap <leader>su :wa <bar> UnitTest<CR>
        nnoremap <F5> :wa <bar> UnitTest<CR>
        ]])end}
    use {'vim-scripts/Decho'    , cmd={ 'Decho'}}

    -- Automatically set up your confiration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end--,
  --  config = {
  --    max_jobs = 16,
  --    compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua', 'packer_compiled.lua'),
  --    git = {
  --      default_url_format = plug_url_format,
  --    },
  --  },
})

local function key_mappings()
  vim.cmd [[packadd which-key.nvim]]

  local wk = require("which-key")

-- --------------------------------------------
-- possession
-- --------------------------------------------
  require("which-key").register({
    ["<leader>a"] = { name = "+possession" },
    ["<leader>as"] = { "<cmd>PossessionSave!<cr>" , "Possession Save"    , noremap = true } ,
    ["<leader>ar"] = { "<cmd>PossessionLoad<cr>"  , "Possession Restore" , noremap = true } ,
  })

-- --------------------------------------------
-- packer
-- --------------------------------------------
  wk.register({ ["<leader>p"] = { name = "+packer" }, -- optional group name
    ["<leader>pi"] = { "<cmd>PackerInstall<cr>" , "Packer Install" , noremap = true } ,
    ["<leader>pc"] = { "<cmd>PackerCompile<cr>" , "Packer Compile" , noremap = true } ,
    ["<leader>ps"] = { "<cmd>PackerStatus<cr>"  , "Packer Status"  , noremap = true } ,
    ["<leader>pu"] = { "<cmd>PackerUpdate<cr>"  , "Packer Update"  , noremap = true } ,
  })

-- --------------------------------------------
-- nvim-tree
-- --------------------------------------------
  wk.register({ ["<leader>n"] = { name = "+nvim-tree" }, -- optional group name
    ["<leader>nt"]  = { "<cmd>NvimTreeFindFileToggle!<cr>"   , "NvimTree Toggle"   , noremap = true } ,
  })

-- --------------------------------------------
-- bufkill 
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
-- spectre 
-- --------------------------------------------
  wk.register({ ["<leader>S"] = { name = "+spectre" }, -- optional group name
    ["<leader>Sw"]  = { function() require('spectre').open_visual({open_cmd = 'new', select_word=true}) end , "Search & Replace Word under cursor with spectre" , noremap = true } ,
  })

  -- --------------------------------------------
  -- Telescope
  -- --------------------------------------------
  local telescope = require('telescope')
  telescope.load_extension('possession')
  telescope.load_extension "file_browser"
  wk.register({
    ["<leader>t"] = { name = "+telescope" }, -- optional group name
    --a = { function() require('telescope.builtin').grep_string({use_regex=true}) end, "Telescope Grep String Under Cursor" , noremap=true } ,
    ["<leader>ta"] = { "<cmd>Telescope marks<cr>"                                              , "Telescope Browse Bookmarks"     , noremap=true }           ,
    ["<leader>tb"] = { function() require('telescope.builtin').buffers({sort_mru=true, ignore_current_buffer=true}) end , "Telescope Open Buffers" , noremap=true } ,
    ["<leader>tf"] = { "<cmd>Telescope find_files<cr>"                                         , "Telescope Find File"            , noremap=true }           ,
    ["<leader>tg"] = { function() require('telescope.builtin').live_grep({use_regex=true}) end , "Telescope Live Grep"            , noremap=true }           ,
    ["<leader>th"] = { "<cmd>Telescope help_tags<cr>"                                          , "Telescope Help"                 , noremap=true }           ,
    ["<leader>tm"] = { function() require('telescope.builtin').keymaps()        end            , "Telescope Mappings"             , noremap=true }           ,
    ["<leader>tp"] = { function() require('telescope').extensions.project.project{} end        , "Telescope Projects"             , noremap=true }           ,
    ["<leader>tr"] = { "<cmd>Telescope oldfiles<cr>"                                           , "Telescope Open Recent File"     , noremap=true }           ,
    ["<leader>ts"] = { "<cmd>Telescope possession list<cr>"                                    , "Telescope Sessions"             , noremap=true }           ,
    ["<leader>tl"] = { "<cmd>Telescope file_browser<cr>"                                    , "Telescope Sessions"             , noremap=true }           ,
  })

  -- --------------------------------------------
  -- vim-cutlass
  -- --------------------------------------------
  vim.keymap.set('n' , 'x'  , 'd'  , {desc= 'Move text to yank'})
  vim.keymap.set('x' , 'x'  , 'd'  , {desc= 'Move text to yank'})
  vim.keymap.set('n' , 'xx' , 'dd' , {desc= 'Move line to yank'})
  vim.keymap.set('n' , 'X'  , 'D'  , {desc= 'Move text until eol to yank'})

  -- --------------------------------------------
  -- vim-matchup
  -- --------------------------------------------
  vim.keymap.set('n' , '<leader>m'  , '<plug>(matchup-hi-surround)', {desc= 'Highlight surrounding'})
  vim.g.matchup_matchparen_deferred = 1

  -- --------------------------------------------
  -- nvim-lspconfig  https://github.com/neovim/nvim-lspconfig/blob/master/test/minimal_init.lua#L36
  -- --------------------------------------------
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local function opts_desc(opts, desc)
    opts.desc = desc
    return  opts
  end

  local opts = { noremap=true, silent=true }

  vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, opts_desc(opts, 'Open floating window'))
  vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts_desc(opts, 'Previous diagnostic msg'))
  vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts_desc(opts, 'Next diagnostic msg'))
  vim.keymap.set('n', '<leader>da', vim.diagnostic.setloclist, opts_desc(opts, 'Diagnostic location list'))

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts_desc(bufopts,'Goto declaration'))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts_desc(bufopts,'Goto definition'))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts_desc(bufopts,'Goto definition'))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts_desc(bufopts,'Goto definition'))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts_desc(bufopts,'Sinature help'))
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts_desc(bufopts,'Goto definition'))
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts_desc(bufopts,'Goto definition'))
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts_desc(bufopts,'Goto definition'))
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts_desc(bufopts,'Type definition'))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts_desc(bufopts,'Rename'))
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts_desc(bufopts,'Code action'))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts_desc(bufopts,'References'))
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts_desc(bufopts,'Format '))
  end

  local lsp_flags = {
    debounce_text_changes = 150, -- This is the default in Nvim 0.7+
  }

  vim.cmd [[packadd nvim-lspconfig]]
  require('lspconfig')['sumneko_lua'].setup{  -- scoop install lua-language-server
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }

end --function key_mappings  


--local packer_group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
--vim.api.nvim_create_autocmd('User', { pattern = 'PackerComplete', callback = key_mappings, group = packer_group, once = true })
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer-nvim.lua source <afile> | PackerCompile
  augroup end
  ]])

key_mappings()


