
vim.cmd [[packadd telescope.nvim]]

local wk = require('which-key')
wk.register({
  ["<leader>t"] = { name = "+telescope" }, -- optional group name
  --a = { function() require('telescope.builtin').grep_string({use_regex=true}) end, "Telescope Grep String Under Cursor" , noremap=true } ,
  ["<leader>ta"] = { "<cmd>Telescope marks<cr>", "Telescope browse bookmarks", noremap = true },
  ["<leader>tb"] = { function() require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true }) end, "Telescope open buffers", noremap = true },
  ["<leader>tf"] = { "<cmd>Telescope find_files<cr>", "Telescope find file", noremap = true },
  ["<leader>tl"] = { function() require('telescope.builtin').live_grep({ use_regex = true }) end, "Telescope live grep", noremap = true },
  ["<leader>tg"] = { function() require('telescope.builtin').grep_string({ use_regex = true }) end, "Telescope grep string", noremap = true },
  ["<leader>th"] = { "<cmd>Telescope help_tags<cr>", "Telescope help", noremap = true },
  ["<leader>tm"] = { function() require('telescope.builtin').keymaps() end, "Telescope mappings", noremap = true },
  ["<leader>tp"] = { function() require('telescope').extensions.project.project {} end, "Telescope projects", noremap = true },
  ["<leader>tr"] = { "<cmd>Telescope oldfiles<cr>", "Telescope open recent file", noremap = true },
  ["<leader>ts"] = { "<cmd>Telescope possession list<cr>", "Telescope possession list", noremap = true },
  ["<leader>tc"] = { "<cmd>Telescope file_browser<cr>", "Telescope file browser", noremap = true },
})

