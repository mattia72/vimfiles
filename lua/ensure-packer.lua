local _M = {}
local utils=require('utils')

_M.packer_compiled_file_name = 'packer_compiled'

_M.packer_compiled_path = utils.join_path(vim.fn.stdpath('config'),
  'lua', --not in 'plugin', so not loaded automatically
  _M.packer_compiled_file_name..'.lua')

function _M.ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

return _M
