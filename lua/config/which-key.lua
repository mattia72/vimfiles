
  local wk = require("which-key")
  wk.setup { 
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
  }

  vim.cmd [[packadd which-key.nvim]]

  local wk = require("which-key")

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
  --if (utils.no_vscode) then
    --local telescope = require('telescope')
    --telescope.load_extension('possession')
    --telescope.load_extension "file_browser"
    --wk.register({
      --["<leader>t"] = { name = "+telescope" }, -- optional group name
      ----a = { function() require('telescope.builtin').grep_string({use_regex=true}) end, "Telescope Grep String Under Cursor" , noremap=true } ,
      --["<leader>ta"] = { "<cmd>Telescope marks<cr>", "Telescope browse bookmarks", noremap = true },
      --["<leader>tb"] = { function() require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true }) end, "Telescope open buffers", noremap = true },
      --["<leader>tf"] = { "<cmd>Telescope find_files<cr>", "Telescope find file", noremap = true },
      --["<leader>tl"] = { function() require('telescope.builtin').live_grep({ use_regex = true }) end, "Telescope live grep", noremap = true },
      --["<leader>tg"] = { function() require('telescope.builtin').grep_string({ use_regex = true }) end, "Telescope grep string", noremap = true },
      --["<leader>th"] = { "<cmd>Telescope help_tags<cr>", "Telescope help", noremap = true },
      --["<leader>tm"] = { function() require('telescope.builtin').keymaps() end, "Telescope mappings", noremap = true },
      --["<leader>tp"] = { function() require('telescope').extensions.project.project {} end, "Telescope projects", noremap = true },
      --["<leader>tr"] = { "<cmd>Telescope oldfiles<cr>", "Telescope open recent file", noremap = true },
      --["<leader>ts"] = { "<cmd>Telescope possession list<cr>", "Telescope possession list", noremap = true },
      --["<leader>tc"] = { "<cmd>Telescope file_browser<cr>", "Telescope file browser", noremap = true },
    --})
  --end

  -- --------------------------------------------
  -- vim-cutlass
  -- --------------------------------------------
  vim.keymap.set('n', 'x', 'd', { desc = 'Move text to yank' })
  vim.keymap.set('x', 'x', 'd', { desc = 'Move text to yank' })
  vim.keymap.set('n', 'xx', 'dd', { desc = 'Move line to yank' })
  vim.keymap.set('n', 'X', 'D', { desc = 'Move text until eol to yank' })

  vim.keymap.set('n' , '<A-j>' , '<cmd>m .+1<CR>=='        , {desc="Move line up"})
  vim.keymap.set('n' , '<A-k>' , '<cmd>m .-2<CR>=='        , {desc="Move line down"})
  vim.keymap.set('i' , '<A-j>' , '<esc><cmd>m .+1<CR>==gi' , {desc="Move line up"})
  vim.keymap.set('i' , '<A-k>' , '<esc><cmd>m .-2<CR>==gi' , {desc="Move line down"})
  vim.keymap.set('v' , '<A-j>' , ":m '>+1<CR>gv=gv"        , {desc="Move line up"})
  vim.keymap.set('v' , '<A-k>' , ":m '<-2<CR>gv=gv"        , {desc="Move line down"})

  -- --------------------------------------------
  -- vim-matchup
  -- --------------------------------------------
  vim.keymap.set('n', '<leader>m', '<plug>(matchup-hi-surround)', { desc = 'Highlight surrounding' })
  vim.g.matchup_matchparen_deferred = 1
