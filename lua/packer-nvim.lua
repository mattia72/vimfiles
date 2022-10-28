
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

local util = require('packer.util')

require("packer").startup({
  function(use)
    -- speed up loading lua modules it is recommened to put impatient.nvim before any other plugins
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}
    use({"wbthomason/packer.nvim", opt = true})
    -- showing keybindings
    use {"folke/which-key.nvim", event = "VimEnter", 
      config = function() vim.defer_fn(function() require('config.which-key') end, 2000) end
    }
    -- icons for several plugins
    use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}
    -- startup screen
    use {'goolord/alpha-nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = [[require('alpha-nvim')]] }
    use {'nvim-telescope/telescope.nvim', cmd = 'Telescope', requires = {'nvim-lua/plenary.nvim'}, config = [[require('telescope-nvim')]]}

    use { "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" }}

  -- Show undo history visually
    use {'simnalamburt/vim-mundo', opt = true, cmd = {"MundoToggle", "MundoShow"}}

 -- auto-completion engine
    use {"onsails/lspkind-nvim", event = "VimEnter"}
    use {"hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]]}

    -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}

    use {'tpope/vim-surround'}

    use {'nvim-lualine/lualine.nvim', event = 'VimEnter', config = [[require('config.lualine-nvim')]] }
    use {'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons'}, config = [[require('config.nvim-tree')]]
      --  tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {'Lokaltog/vim-easymotion'}   -- ,,w
    use {'chentoast/marks.nvim', config = [[require('config.marks-nvim')]]}
    use {'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup {} end }

    use {'rmagatti/auto-session', config = function() require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "/" },
        auto_session_enabled = true, -- alpha/dashboard won't shown, if ~ has a session
        auto_save_enabled = false,
        auto_restore_enabled = true,
      }
    end,
      run = function () vim.cmd([[
         command AutoSaveSession SaveSession  
         command AutoRestoreSession RestoreSession 
         command AutoDeleteSession DeleteSession 
      ]])
      end
    }
    -- use {'rmagatti/session-lens', requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    --   config = function() require('session-lens').setup({path_display = {'shorten'}}) end }

    use {'nvim-treesitter/nvim-treesitter', event = 'BufEnter', run = ":TSUpdate", config = [[require('config.nvim-treesitter')]] }
    --
    use {'preservim/nerdcommenter'}

    -- Automatically set up your configuration after cloning packer.nvim
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

