-- this file will be renamed to init.lua 
--

local function get_file_name(file)
  return file:match("[^/]*.lua$")
end

local info = debug.getinfo(1,'S');
local startTime = os.clock()
vim.g.HOME = os.getenv("HOME")

local utils = require('utils')
vim.g.init_root_dir=utils.join_path(os.getenv('XDG_CONFIG_HOME'), 'nvim\\')

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

require('packer-nvim') -- Plugins
require('settings')
require('mappings')

utils.echom(get_file_name(info.source)..' loaded in '..os.clock()-startTime)

--vim.cmd "EchoModeMsg vimrc 'current directory:' . getcwd()"
