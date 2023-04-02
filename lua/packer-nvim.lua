local utils = require('utils')


local epacker = require('ensure-packer')
local packer_bootstrap = epacker.ensure_packer()

-- the plugin install follows from here

local packer = require('packer')
packer.init ({
  compile_path = epacker.packer_compiled_path
})

packer.startup({
  function(use)
    -- speed up loading lua modules
    -- put impatient.nvim before any other plugins
    use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

    use { "wbthomason/packer.nvim", opt = true }

    --
    -- LSP Configuration & Plugins-
    --
    use { 'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim', -- needs wget, curl and others check :checkhealt mason
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
    --cond = {utils.no_vscode},
    config = function() require('config.lsp') end
    }

    --
    -- Autocompletion
    --            
    use { 'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' } 
    }

    --
    -- Highlight, edit, and navigate code
    --
    use { 'nvim-treesitter/nvim-treesitter',
      run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
      --cond = {utils.no_vscode} so doesn't work
    }

    --
    -- Additional text objects via treesitter
    --
    use { 'nvim-treesitter/nvim-treesitter-textobjects', 
      after = 'nvim-treesitter',
      requires = "nvim-treesitter/nvim-treesitter" ,
      --config = function() vim.cmd [[packadd nvim-treesitter]] end,
      --cond = {utils.no_vscode}  so doesn't work
    }

    --
    -- Gui
    --
    use { "folke/which-key.nvim", event = "VimEnter", cond = {utils.no_vscode}, -- showing keybindings
      config = function() vim.defer_fn(function() require('config.which-key') end, 2000.0) end,
    }
    use { 'kyazdani42/nvim-web-devicons', event = 'VimEnter', cond = {utils.no_vscode}}                                                             -- eg. :stew: icons for several plugins
    use { 'nvim-lualine/lualine.nvim', event = 'VimEnter', config = [[require('config.lualine-nvim')]], cond = {utils.no_vscode} }
    use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, config = [[require('config.nvim-tree')]], cond = {utils.no_vscode} } -- tag = 'nightly' -- optional, updated every week. (see issue #1193) }
    use { 'chentoast/marks.nvim', config = [[require('config.marks-nvim')]], cond = {utils.no_vscode}}
    use { 'rcarriga/nvim-notify', cond = {utils.no_vscode}}

    --
    -- Sessions, views
    --
    use { 'jedrzejboczar/possession.nvim', requires = { 'nvim-lua/plenary.nvim' },
      config = function() require("config.possession") end, cond = {utils.no_vscode}
    }

    --
    -- Telescope
    --
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' },
      after = {"which-key.nvim"},
      config = function() require('config.telescope-nvim') end,
      cond = {utils.no_vscode}
    }
    use { 'nvim-telescope/telescope-project.nvim', requires = { 'nvim-telescope/telescope.nvim' },
      config = function()
        vim.cmd [[
        packadd telescope.nvim
        packadd possession.nvim
        ]]
        require('telescope').load_extension('possession') end,
      cond = {utils.no_vscode}
    }
    use { 'nvim-telescope/telescope-file-browser.nvim', requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function() vim.cmd [[packadd telescope.nvim]] require('telescope').load_extension('file_browser') end,
      cond = {utils.no_vscode}
    }

    --
    -- Colorscheme
    --
    use {'navarasu/onedark.nvim', cond = {utils.no_vscode}} -- Theme inspired by Atom
    use {'morhetz/gruvbox'      , cond = {utils.no_vscode}} -- Gruvbox is heavily inspired by badwolf, jellybeans and solarized.

    -- vscode doesn't like it
    --use { 'Shatur/neovim-session-manager', cond = {utils.no_vscode}, requires = { 'nvim-lua/plenary.nvim' }, 
      --config = function() require("config.neovim-session-manager") end
    --}
    --use { 'zhimsel/vim-stay' } --auto view creation

    --
    -- Git
    --
    use { 'tpope/vim-fugitive', cmd = { 'G' }, cond = {utils.no_vscode} } -- git wrapper
    --
    -- Moving helpers with mappings
    --
    --use {'Lokaltog/vim-easymotion'} -- ,,w
    --use {'justinmk/vim-sneak'}      -- s<char><char> than ; or s to the next
    use { 'ggandor/lightspeed.nvim', keys={ 's', 'S' } } --  s<char><char> or s<char><space>...

    use { 'andymass/vim-matchup', event = 'VimEnter *'}  -- di% --modern matchit and matchparen replacement, even better % navigate and highlight matching words
    use { 'yssl/QFEnter', event = 'QuickFixCmdPre', cond={utils.no_vscode}}          -- QFEnter allows you to open items from quickfix or location list wherever you wish.

    --
    -- Edit helpers with mappings
    --
    use { 'tpope/vim-repeat' }                     -- repeats eg. surround mappings
    use { 'preservim/nerdcommenter' }              -- ,c<space>
    use { 'tpope/vim-surround' }                   -- s
    use { 'godlygeek/tabular', cmd = { 'Tabularize' } } -- creating tables
    use { 'junegunn/vim-easy-align', config = {
      function()
        local m = require('mapper')
        m.xmap('ga', '<Plug>(EasyAlign)')
        m.nmap('ga', '<Plug>(EasyAlign)')
      end}}
    use { 'tommcdo/vim-exchange' }                 -- exchange word: cxiw <move> . line: cxx<move>.
    use { 'svermeulen/vim-cutlass', after = {'lightspeed.nvim'}, opt = true }      -- x remapped!!!, d doesn't affect yank !!!breaks if not opt!!!
    use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }
    use { 'wellle/targets.vim' }                   -- more text objects https://github.com/wellle/targets.vim/blob/master/cheatsheet.md)

    --
    -- Search / replace
    --
    use { 'mileszs/ack.vim', cmd = { 'Ack' } } -- the better grep
    use { 'tpope/vim-abolish', cmd = { 'S' } } -- :%S/facilit{y , ies}/building{ , s}/g
    --use { 'nvim-pack/nvim-spectre', cmd = {'Spectre'}} -- Search replace 

    --
    -- startup screen
    --
    use {'goolord/alpha-nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'jedrzejboczar/possession.nvim',
        'wbthomason/packer.nvim',
         'nvim-lua/plenary.nvim' -- in config.alpha-nvim
      },
      config = function() require('config.alpha-nvim') end,
      cond = {utils.no_vscode}
    }

    --
    -- Filetype helpers
    --
    use { 'vim-scripts/xml.vim', ft = { 'xml' } }
    use { 'vim-scripts/perl-support.vim', ft = { 'perl' } }
    use { 'kchmck/vim-coffee-script', ft = { 'coffe' } }
    --use {'zigford/vim-powershell'       , ft = {'ps1', 'psm1'}}
    use { 'PProvost/vim-ps1', ft = { 'ps1', 'psm1' } }
    use { 'euclidianAce/BetterLua.vim', ft = { 'lua' } }
    use {'sam4llis/nvim-lua-gf', ft = {'lua','vim'}}
    --
    -- Command helpers
    --
    use { 'skywind3000/asyncrun.vim' , cond = {utils.no_vscode}}         --, cmd = { 'AsyncRun' }}
    use { 'qpkorr/vim-bufkill' , cond = {utils.no_vscode}}               --cmd = {'BD', 'BB', 'BF', 'BW '}} -- buffer without closing window :BD, BW, BF, BB doesn't work properly if lazy loaded.

    --
    -- My own plugins
    --
    --use  'mattia72/vim-abinitio' , { 'for': ['abinitio' ] }
    use { '~/dev/vim/vim-delphi', ft = { 'delphi' } }
    use { '~/dev/vim/vim-ripgrep', cmd ={ 'RipGrep'}}
    use { '~/dev/vim/vim-copy-as-rtf', cmd = { 'CopyRTF' } }

    use { 'vim-scripts/genutils', opt = true }
    use { 'albfan/vim-breakpts', require = { 'genutils' }, cmd = { 'BreakPts' } }
    use { 'h1mesuke/vim-unittest', cmd = { 'UnitTest' },
      run = function()
        vim.keymap.set('n', '<leader>su', '<cmd>wa <bar> UnitTest<cr>', { desc = 'Save and start unittest' })
        vim.keymap.set('n', '<F5>', '<cmd>wa <bar> UnitTest<cr>', { desc = 'Save and start unittest' })
      end }
    use { 'vim-scripts/Decho', cmd = { 'Decho' } }

    -- Automatically set up your confiration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end
})

--local packer_group = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
--vim.api.nvim_create_autocmd('User', { pattern = 'PackerComplete', callback = key_mappings, group = packer_group, once = true })
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer-nvim.lua source <afile> | PackerCompile
  augroup end
  ]])

if utils.ispath(epacker.packer_compiled_path) then
  require(epacker.packer_compiled_file_name)
end


