
local _M = {}
--local Path = require('plenary.path')

function _M.notify_info(title, msg)
  require('notify')(msg,'info', {timeout=2000, title=title})
end
 
function _M.create_cmd_with_notify(args)
  setmetatable(args,{__index={opts={nargs=0, bang=true}}})
  vim.api.nvim_create_user_command(args.name,
    function(opts)
      vim.cmd(args.cmd)
      _M.notify_info(args.notify_msg)
    end,
    args.opts
  )
end

function _M.join_paths(...)
  local on_windows = vim.loop.os_uname().version:match 'Windows'
  local path_sep = on_windows and '\\' or '/'
  local result = table.concat({ ... }, path_sep)
  return result
end--

function _M.get_last_modified_in_dir(dir, file_pattern)
  local last_modified
  for file in io.popen('dir '.. _M.join_paths(dir, file_pattern)..' /b /od'):lines()  do 
    last_modified  = file
  end
  return last_modified
end


function _M.table_count(tbl, cond)
  local count = 0
  local count_cond = 0
  for key, val in pairs(tbl) do  -- Table iteration.
    if(cond(val)) then
      count_cond = count_cond + 1
    end
    count = count + 1
  end
  return count, count_cond
end

return _M