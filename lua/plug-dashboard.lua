--
-- lua config file for dashboard 
--

local db = require('dashboard')
local version = vim.version()

vim.g.dashboard_session_directory = "~/.cache/session"

db.custom_header = {
'                                                                                                                       ',
'     ░▓▓▓            ▓▓▓                                                                                              ',
'   ▒▓▓▓▓▓▓▒          ░▓▓▓▓                                                                                            ',
' ▒▓▓▓▓▓▓░░░░         ▓▓▓▓▓▓▒                                                               ▓▓▓▓                       ',
' ▓▓▓▓▓▓▓▓▒▒▒▒        ▓▓▓▓▓▓▓                                                                                          ',
' ▓▓▓▓▓▓▓▓▓▓▓▓▓▒      ░▓▓▓▓▓▓       ▒    ▓▓▒▒         ▒▒▓▒         ▒▓▓▒▒    ▓▓▓▓       ▒▓▓▓ ▓▓▓▓  ▓▓▓ ░▓▓▓▓▒  ░▓▓▓▓▓▓  ',
' ░░░░░▒▓▓▓▓▓▓▓▓▓     ░▓▓▓▓▓▓       ▓▓▓░     ▓▒    ▓▓      ░▓   ░▓▓     ░▓▓  ▓▓▓▓     ▓▓▓▓  ▓▓▓▓  ▓▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▒',
' ▒▒▒▒▒▒▒░▒▒▒▒▒▒▒▒    ░▓▓▓▓▓▓       ▓▓        ▓░  ▓░        ▓░ ▓▓         ▓▓  ▓▓▓▓    ▓▓▓░  ▓▓▓▓  ▓▓▓▓    ░▓▓▓▒    ▒▓▓▓',
' ░░░░░░░ ▒▒▒▒▒▒▒▒▒▒  ░▓▓▓▓▓▓       ▓▓        ▓░ ░▓▓▓▓▓▓▓▓▓▓▓▓ ▓▒          ▓▓  ▓▓▓   ▓▓▓▓   ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓',
' ░░░░░░░   ▒▒▒▒▒▒▒▒▒ ░▓▓▓▓▓▓       ▓▓        ▓░ ░▓            ▓▓          ▓▓  ▓▓▓▓ ▒▓▓▓    ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓',
' ░░░░░░░    ▒▒▒▒▒▒▒▒▒░▓▓▓▓▓▓       ▓▓        ▓░  ▓░           ▓▓         ▓▓    ▒▓▓▒▓▓▓     ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓',
' ░░░░░░░     ▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓       ▓▓        ▓░   ▓▓       ▓▒  ▒▓       ▓▓░     ▓▓▓▓▓      ▓▓▓▓  ▓▓▓▓     ▓▓▓▒    ▒▓▓▓',
' ░░░░░░░       ░░░░░░▓▓▓▓▓▓▓       ▓▓        ▓░     ▒▓▓▓▓▓▒      ░▒▓▓▓▓▒         ▒▒▒░      ▓▓▓▓  ▓▓▓▒     ▓▓▓▒    ▓▓▓▓',
' ░░░░░░░        ▓▒▒▒▒▓▓▓▓▓▓▓                                                                                          ',
'  ░░░░░░         ▓▓▓▓▓▓▓▓▓▓                                                                                           ',
'    ░░░░           ▓▓▓▓▓▓▓                                                                                            ',
'      ░▒            ░▓▓▓                                                                                              ',
' ' .. version.major .. '.' .. version.minor .. '-' .. version.patch
}

local icon_color = "Title"
db.custom_center = {
  {icon_hl={link=icon_color}, icon="  ", desc="New File                  ", shortcut='          ', action='DashboardNewFile' },
  {icon_hl={link=icon_color}, icon="  ", desc="Delphi                    ", shortcut='          ', action='so ~/delphi-dev.vim | so ~/Session.vim' } ,
  {icon_hl={link=icon_color}, icon="  ", desc="Reload Last Session       ", shortcut='          ', action='SessionLoad'},           
  {icon_hl={link=icon_color}, icon="  ", desc="Recently Opened Files     ", shortcut='<leader>tr', action='Telescope oldfiles'},    
--{icon_hl={link=icon_color}, icon="  ", desc="Open Project              ", shortcut='          ', action='Telescope ???'},         
  {icon_hl={link=icon_color}, icon="  ", desc="Jump to Bookmark          ", shortcut='<leader>ta', action='Telescope marks'},       
  {icon_hl={link=icon_color}, icon="  ", desc="Find File                 ", shortcut='<leader>tf', action='Telescope find_files'},  
  {icon_hl={link=icon_color}, icon="  ", desc="Find Word                 ", shortcut='<leader>tg', action='Telescope live_grep'},   
  {icon_hl={link=icon_color}, icon="  ", desc="Search Help               ", shortcut='<leader>th', action='Telescope help_tags'},   
  {icon_hl={link=icon_color}, icon="  ", desc="Open Neovim Configuration ", shortcut='<leader>vi', action='tabnew! $MYVIMRC'}, 
  {icon_hl={link=icon_color}, icon="⏻  ", desc="Quit                      ", shortcut='          ', action='q'},      
}                                     

--local total_plugins = #vim.tbl_keys(packer_plugins)
local total_plugins = vim.call('len', vim.g.plugs)
db.custom_footer =  {"  neovim loaded " .. total_plugins .. " plugins."}

--db.preview_file_Path    -- string or function type that mean in function you can dynamic generate height width
--db.preview_file_height  -- number type
--db.preview_file_width   -- number type
--db.preview_command      -- string type (can be ueberzug which only work in linux)
--db.confirm_key          -- string type key that do confirm in center select
db.hide_statusline=false      -- boolean default is true.it will hide statusline in dashboard buffer and auto open in other buffer
db.hide_tabline=false         -- boolean default is true.it will hide tabline in dashboard buffer and auto open in other buffer
--db.hide_winbar          -- boolean default is true.it will hide the winbar in dashboard buffer and auto open in other buffer
--db.session_directory    -- string type the directory to store the session file
--db.header_pad           -- number type default is 1
--db.center_pad           -- number type default is 1
--db.footer_pad           -- number type default is 1

-- Highlight Group
--DashboardHeader DashboardCenter DashboardShortCut DashboardFooter
--vim.api.nvim_set_hl(0, 'DashboardHeader',    {link='Statement' })
--vim.api.nvim_set_hl(0, 'DashboardCenter',    {fg='#ffaf00'})
--vim.api.nvim_set_hl(0, 'DashboardShortCut ', {fg='#ffaf00'})
--vim.api.nvim_set_hl(0, 'DashboardFooter',    {fg='#008f00'})

--vim.cmd([[hi DashboardHeader guifg=#0087d7]])
vim.cmd([[ 
autocmd FileType Dashboard setlocal nofoldenable nornu nonu 
autocmd FileType Dashboard hi link DashboardHeader Label
autocmd FileType Dashboard hi link DashboardCenter Identifier
autocmd FileType Dashboard hi link DashboardShortCut String
autocmd FileType Dashboard hi link DashboardFooter Comment
]])

-- Command

--DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
--SessionSave,SessionLoad 
--
