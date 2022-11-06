--
-- lua config file for telescope 
--

local fb_actions = require 'telescope'.extensions.file_browser.actions

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
    prompt_prefix = '(help:<c-h>)> ',
    selection_caret = '> ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'closest', --"reset",
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
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
        ['<c-h>'] = 'which_key',
    	  ['<c-d>'] = require('telescope.actions').delete_buffer,
      }, -- n
      i = {
        ['<c-h>'] = 'which_key',
        ['<c-d>'] = require('telescope.actions').delete_buffer,
      } -- i
    }, -- mappings
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
          -- your custom insert mode mappings
        n = {
          ['<c-h>'] = 'which_key',
        },
        i = {
          ['<c-h>'] = 'which_key',
          ['<leader>h>'] = fb_actions.goto_home_dir,
        },
      },
    },
  },
}

 -- "nnoremap <leader>fg :Telescope live_grep prompt_prefix=🔍 <CR>
