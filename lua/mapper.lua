
local _M = {}

function _M.map(args)
  setmetatable(args, {__index={ options={}}})
  local mode, shortcut, command, options =
      args[1] or args.mode,
      args[2] or args.shortcut,
      args[3] or args.command,
      args[4] or args.options
  vim.keymap.set(mode, shortcut, command, options)
end

function _M.nmap(shortcut, command, options)
  _M.map{ 'n', shortcut, command, options }
end

function _M.imap(shortcut, command, options)
  _M.map{ 'i', shortcut, command, options }
end

function _M.tmap(shortcut, command, options)
  _M.map{ 't', shortcut, command, options }
end

function _M.cmap(shortcut, command, options)
  _M.map{ 'c', shortcut, command, options }
end

function _M.vmap(shortcut, command, options)
  _M.map{ 'v', shortcut, command, options }
end

function _M.xmap(shortcut, command, options)
  _M.map{ 'x', shortcut, command, options }
end

return _M
