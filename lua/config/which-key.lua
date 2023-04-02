
  local wk = require("which-key")
  wk.setup {
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
  }

  vim.cmd [[packadd which-key.nvim]]

  -- --------------------------------------------
  -- possession
  -- --------------------------------------------
  require("which-key").register({
    ["<leader>a"] = { name = "+possession" },
    ["<leader>as"] = { "<cmd>PossessionSave!<cr>", "Possession save", noremap = true },
    ["<leader>ar"] = { "<cmd>PossessionLoad<cr>", "Possession restore", noremap = true },
  })

  -- --------------------------------------------
  -- packer
  -- --------------------------------------------
  wk.register({
    ["<leader>p"] = { name = "+packer" },             -- optional group name
    ["<leader>pi"] = { "<cmd>PackerInstall<cr>", "Packer install", noremap = true },
    ["<leader>pc"] = { "<cmd>PackerCompile<cr>", "Packer compile", noremap = true },
    ["<leader>ps"] = { "<cmd>PackerStatus<cr>", "Packer status", noremap = true },
    ["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Packer update", noremap = true },
  })

  -- --------------------------------------------
  -- nvim-tree
  -- --------------------------------------------
  wk.register({
    ["<leader>n"]  = { name = "+nvim-tree" },            -- optional group name
    ["<leader>nt"] = { "<cmd>NvimTreeFindFileToggle!<cr>", "NvimTree tggle", noremap = true },
  })

  -- --------------------------------------------
  -- bufkill
  -- --------------------------------------------
  wk.register({
    ["<leader>b"]   = { name = "+bufkill" },           -- optional group name
    ["<leader>bk"]  = { "<cmd>BD<cr>", "Delete Buffer", noremap = true },
    ["<leader>bka"] = { "<cmd>bufdo BD<cr>", "Delete All Buffer", noremap = true },
    ["<leader>bp"]  = { "<cmd>BB<cr>", "Previous Buffer", noremap = true },
    ["<leader>bn"]  = { "<cmd>BF<cr>", "Next Buffer", noremap = true },
    ["<leader>bc"]  = { "<cmd>ls<cr>:b<space>", "Buffer Change (with tab compl)", noremap = true },
    ["<leader>bs"]  = { "<cmd>ls<cr>:sb<space>", "Buffer Split (with tab compl)", noremap = true },
  })

  -- --------------------------------------------
  -- spectre
  -- --------------------------------------------
  wk.register({
    ["<leader>S"]  = { name = "+spectre" },            -- optional group name
    ["<leader>Sw"] = { function() require('spectre').open_visual({ open_cmd = 'new', select_word = true }) end,
      "Search & Replace Word under cursor with spectre", noremap = true },
  })

  -- --------------------------------------------
  -- Telescope
  -- --------------------------------------------

  require('config.telescope-which-key')


  -- --------------------------------------------
  -- vim-matchup
  -- --------------------------------------------
  vim.keymap.set('n', '<leader>m', '<plug>(matchup-hi-surround)', { desc = 'Highlight surrounding' })
  vim.g.matchup_matchparen_deferred = 1
