
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

require("packer").startup({
  function(use)
    -- speed up loading lua modules it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}
    use({"wbthomason/packer.nvim", opt = true})
    -- showing keybindings
    use {"folke/which-key.nvim", event = "VimEnter", 
    config = function() vim.defer_fn(function() require('config.which-key') end, 2000) end }
    -- icons for several plugins
    use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}
    -- startup screen
    use {'goolord/alpha-nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = [[require('alpha-nvim')]] }
    use {'nvim-telescope/telescope.nvim',  requires = {'nvim-lua/plenary.nvim'}, config = [[require('telescope-nvim')]]}

    use { "skywind3000/asyncrun.vim", cmd = { "AsyncRun" }}

    -- Show undo history visually
    use {'simnalamburt/vim-mundo', cmd = {"MundoToggle", "MundoShow"}}
    use {'qpkorr/vim-bufkill'    , cmd = {'BD', 'BB', 'BF', 'BW '}}--delete buffer without closing window :BD, BW, BF, BB

    use {'rcarriga/nvim-notify'}
    -- auto-completion engine
    --use 'neovim/nvim-lspconfig'
    --use {"onsails/lspkind-nvim", event = "VimEnter"}
    --use {"hrsh7th/nvim-cmp", after ={"nvim-lspconfig", "lspkind-nvim"}, config = [[require('config.nvim-cmp')]]}
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("config.nvim-cmp").setup()
      end,
      wants = { "LuaSnip" },
      requires = {
        'neovim/nvim-lspconfig', -- +
        'onsails/lspkind-nvim', --+
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'ray-x/cmp-treesitter',
        --"hrsh7th/cmp-nvim-lsp",
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

    -- nvim-cmp completion sources
    --use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    --use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    --use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    --use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}

    use {'nvim-lualine/lualine.nvim', event = 'VimEnter', config = [[require('config.lualine-nvim')]] }
    use {'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons'}, config = [[require('config.nvim-tree')]]} -- tag = 'nightly' -- optional, updated every week. (see issue #1193) }
    use {'chentoast/marks.nvim', config = [[require('config.marks-nvim')]]}
    use {'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }

    use {'p00f/nvim-ts-rainbow', require={'nvim-treesitter'}}
    use {'nvim-treesitter/nvim-treesitter', event = 'BufEnter', run = ":TSUpdate", config = [[require('config.nvim-treesitter')]] }

    --
    -- Sessions
    --
    use {'rmagatti/auto-session', config = function() require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "/" },
      auto_session_enabled = true, -- alpha/dashboard won't shown, if ~ has a session
      auto_save_enabled = false,
      auto_restore_enabled = true }
    end } --run = auto_session_run }
    use {'rmagatti/session-lens', requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
      config = function() require('session-lens').setup({path_display = {'shorten'}}) end }

    use {'tpope/vim-fugitive'}                     -- git wrapper
    use {'mileszs/ack.vim', cmd = 'Ack'} -- the better grep

    --
    -- Moving helpers with mappings
    --
    use {'Lokaltog/vim-easymotion'} -- ,,w
    use {'justinmk/vim-sneak'}      -- s<char><char> than ; or s to the next
    use {'andymass/vim-matchup'}    -- modern matchit and matchparen replacement, even better % navigate and highlight matching words
    use {'yssl/QFEnter'}            -- QFEnter allows you to open items from quickfix or location list wherever you wish.

    --
    -- Edit helpers with mappings
    --
    use {'tpope/vim-repeat'}                                 -- repeats eg. surround mappings
    use {'preservim/nerdcommenter'}                          -- ,c<space>
    use {'tpope/vim-surround'}                               -- s
    use {'godlygeek/tabular', cmd =  'Tabularize',
      run = ':cabbrev tabi Tabularize'}                      -- creating tables
    use {'tpope/vim-abolish' , cmd = 'S'}           -- :%S/facilit{y, ies}/building{, s}/g
    use {'tommcdo/vim-exchange'}                              -- exchange word: cxiw <move> . line: cxx<move>.

    -- 
    -- Filetype helpers
    --
    use {'vim-scripts/xml.vim'          , ft = {'xml'}}
    use {'vim-scripts/perl-support.vim' , ft = {'perl'}}
    use {'kchmck/vim-coffee-script'     , ft = {'coffe'}}
    --use {'zigford/vim-powershell'       , ft = {'ps1', 'psm1'}}
    use {'PProvost/vim-ps1'             , ft = {'ps1', 'psm1'}}
    
    --
    -- My own plugins
    --
    --use  'mattia72/vim-abinitio' , { 'for': ['abinitio' ] }
    use {'~/dev/vim/vim-delphi'     }
    use {'~/dev/vim/vim-ripgrep'    }
    use {'~/dev/vim/vim-copy-as-rtf'}

    use {'vim-scripts/genutils', opt= true}
    use {'albfan/vim-breakpts', require = {'genutils'}, cmd = 'BreakPts' }
    use {'h1mesuke/vim-unittest', cmd= 'UnitTest',
      run = function() vim.cmd([[
        nnoremap <leader>su :wa <bar> UnitTest<CR>
        nnoremap <F5> :wa <bar> UnitTest<CR>
        ]])end}
    use {'vim-scripts/Decho'    , cmd= 'Decho'}

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

vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer-nvim.lua source <afile> | PackerCompile
  augroup end
  ]])

-- --------------------------------------------
-- auto-session
-- --------------------------------------------
auto_session_run = function()
  local utils = require('utils')
  utils.create_cmd({name='AutoSaveSession', cmd='SaveSession', notify_msg= 'Session saved'})
  utils.create_cmd({name='AutoRestoreSession', cmd='RestoreSession', notify_msg= 'Session restored'})
  utils.create_cmd({name='AutoDeleteSession', cmd='DeleteSession', notify_msg= 'Session delted'})

  vim.cmd [[packadd which-key.nvim]]
  require("which-key").register({ 
    ["<leader>a"] = { name = "+auto-session" }, 
    ["<leader>as"] = { "<cmd>AutoSaveSession<cr>"    , "Autosession Save"    , noremap = true } ,
    ["<leader>ar"] = { "<cmd>AutoRestoreSession<cr>" , "Autosession Restore" , noremap = true } ,
    ["<leader>ad"] = { "<cmd>AutoDeleteSession<cr>"  , "Autosession Delete"  , noremap = true }  })
    --    require('notify')(',a mapping was set','info')
end

vim.cmd [[packadd which-key.nvim]]
auto_session_run()

local wk = require("which-key")
---- --------------------------------------------
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
  ["<leader>nt"]  = { "<cmd>NvimTreeToggle<cr>"      , "NvimTree Toggle"         , noremap = true } ,
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
-- Telescope
-- --------------------------------------------
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
