
local _M = {}

function _M.notify_info(msg, title)
  require('notify')(msg,'info', {timeout=2000, title=title})
end
 
function _M.create_cmd(args)
  setmetatable(args,{__index={opts={nargs=0, bang=true}}})
  vim.api.nvim_create_user_command(args.name,
    function(opts)
      vim.cmd(args.cmd)
      _M.notify_info(args.notify_msg)
    end,
    args.opts
  )
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
