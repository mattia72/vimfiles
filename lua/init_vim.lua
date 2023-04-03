-- this file will be renamed to init.lua 
--


vim.g.HOME = os.getenv("HOME")

local utils = require('utils')
vim.g.init_root_dir=utils.join_path(os.getenv('XDG_CONFIG_HOME'), 'nvim\\')

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

-- Plugins
require('packer-nvim')

require('settings')
require('mappings')

print('init.lua loaded')

