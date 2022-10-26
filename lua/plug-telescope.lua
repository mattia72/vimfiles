--
-- lua config file for telescope 
--

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "(help:<c-h>)> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "closest", --"reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,              
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      n = {
        ['<c-h>'] = "which_key",
    	  ['<c-d>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ['<c-h>'] = "which_key",
        ['<c-d>'] = require('telescope.actions').delete_buffer
      } -- i
    } -- mappings
  }
}

local wk = require("which-key")
wk.register({ 
    ["<leader>t"] = { name = "+telescope" }, -- optional group name
    --a = { function() require('telescope.builtin').grep_string({use_regex=true}) end, "Telescope Grep String Under Cursor" , noremap=true } ,
    ["<leader>tf"] = { "<cmd>Telescope find_files<cr>"                              , "Telescope Find File"        , noremap=true }        ,
    ["<leader>tr"] = { "<cmd>Telescope oldfiles<cr>"                                , "Telescope Open Recent File" , noremap=true }        ,
    ["<leader>ta"] = { "<cmd>Telescope marks<cr>"                                   , "Telescope Browse Bookmarks"     , noremap=true }        ,
    ["<leader>tb"] = { function() require('telescope.builtin').buffers({sort_mru=true, ignore_current_buffer=true}) end , "Telescope Open Buffers" , noremap=true }        ,
    ["<leader>tg"] = { function() require('telescope.builtin').live_grep({use_regex=true}) end, "Telescope Live Grep" , noremap=true } ,
    ["<leader>th"] = { "<cmd>Telescope help_tags<cr>"                               , "Telescope Help"             , noremap=true }        ,
    ["<leader>tm"] = { function() require('telescope.builtin').keymaps()        end , "Telescope Mappings"         , noremap=true }        ,
    -- --n = { "New File" }, -- just a label. don't create any mapping 
    -- --e = "Edit File", -- same as above    
    -- --["1"] = "which_key_ignore",  -- special label to hide it in the popup
    --b = { function() print("bar") end, "Foobar" } -- you can also pass functions!  
})


 -- "nnoremap <leader>fg :Telescope live_grep prompt_prefix=🔍 <CR>
