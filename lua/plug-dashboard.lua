--
-- lua config file for dashboard 
--

----nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
----vim.api.nvim_set_keymap('n', '<leader>ff', ':DashboardFindFile<CR>', { noremap = true, silent = true })
----"nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
----"nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
----nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
----vim.api.nvim_set_keymap('n', '<leader>fa', ':DashboardFindWord<CR>', { noremap = true, silent = true })
----"nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
----"nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
--vim.api.nvim_set_keymap('n', '<leader>ss', ':<C-u>SessionSave<CR>', { noremap = false, silent = true })


local db = require('dashboard')
local version = vim.version()
local icon_color = "Function"

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
"v" .. version.major .. "." .. version.minor,

}

db.custom_center = {
  {icon_hl={link=icon_color}, icon="   ",desc="New File                  ", shortcut='n', action='DashboardNewFile' },
  {icon_hl={link=icon_color}, icon="   ",desc="Delphi                    ", shortcut='d', action='so ~/delphi-dev.vim | so ~/Session.vim' } ,
  {icon_hl={link=icon_color}, icon="   ",desc="Reload Last Session       ", shortcut='r', action='SessionLoad'},           
  {icon_hl={link=icon_color}, icon="   ",desc="Recently Opened Files     ", shortcut='o', action='Telescope oldfiles'},    
  {icon_hl={link=icon_color}, icon="   ",desc="Open Project              ", shortcut='p', action='Telescope ???'},         
  {icon_hl={link=icon_color}, icon="   ",desc="Jump to Bookmark          ", shortcut='m', action='Telescope marks'},       
  {icon_hl={link=icon_color}, icon="   ",desc="Browse File               ", shortcut='b', action='Telescope file_browser'},
  {icon_hl={link=icon_color}, icon="   ",desc="Find File                 ", shortcut='f', action='Telescope find_files'},  
  {icon_hl={link=icon_color}, icon="   ",desc="Find Word                 ", shortcut='w', action='Telescope live_grep'},   
  {icon_hl={link=icon_color}, icon="   ",desc="Search Help               ", shortcut='h', action='Telescope help_tags'},   
  {icon_hl={link=icon_color}, icon="ﭻ   ",desc="Key Mappings              ", shortcut='m', action='Telescope keymaps'},     
  {icon_hl={link=icon_color}, icon="   ",desc="Open Neovim Configuration ", shortcut='c', action='tabnew! $MYVIMRC'}      
}                                     

db.custom_footer = { "type  :help<Enter>  or  <F1>  for on-line help" }

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
vim.api.nvim_set_hl(0, 'DashboardHeader',    {fg='#0087d7'})
vim.api.nvim_set_hl(0, 'DashboardCenter',    {fg='#ffaf00'})
--vim.api.nvim_set_hl(0, 'DashboardShortCut ', {fg='#ffaf00'})
vim.api.nvim_set_hl(0, 'DashboardFooter',    {fg='#008f00'})

--vim.cmd('hi DashboardHeader guifg=#0087d7')

-- Command

--DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
--SessionSave,SessionLoad 

--
--'            ▓                 ▒                                                                                                                                 ',
--'        ░▓▓░                ▓▓▓                                                                                                                                 ',
--'      ▒▓▓▓▓▓▓               ▒▓▓▓▓                                                                                                                               ',
--'    ▓▓▓▓▓▓░▓▓▓▓             ░▓▓▓▓▓▓                                                                                        ░░░░░░                               ',
--'  ▒▒▓▓▓▓▓▓▒░░░░░            ▓▓▓▓▓▓▓▓▓                                                                                      ▒▓▓▓▓▓                               ',
--'▓▓▓▓▒▓▓▓▓▓▒▒▒▒▒▒▒           ▓▓▓▓▓▓▓▓▓▓▒                                                                                    ▒▓▓▓▓▓                               ',
--'▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▒         ▒▓▓▓▓▓▓▓▓▓▒                                                                                                                         ',
--'▓▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▒        ░▓▓▓▓▓▓▓▓▓▒          ▒▓   ▒▓▓▓▓▓▓           ▓▓▓▓▓▓▓░          ▓▓▓▓▓▓▓▓     ▓▓▓▓▓         ▒▓▓▓▓ ▒▓▓▓▓▓  ░▓▓▓▓ ▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓  ',
--'▓░░░░░░░▒▓▓▓▓▓▓▓▓▓▓▓▓       ░▓▓▓▓▓▓▓▓▓▒          ▒▓░▓▓░     ▒▓▓░     ▓▓▒       ░▓▓     ▒▓▓▒      ░▓▓░  ░▓▓▓▓▓       ▒▓▓▓▓▓ ▒▓▓▓▓▓  ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░',
--'▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓     ░▓▓▓▓▓▓▓▓▓▒          ▒▓▓          ▓▓░   ░▓░          ▒▓   ▒▓▓          ░▓▓  ▒▓▓▓▓▓      ▓▓▓▓▒  ▒▓▓▓▓▓  ░▓▓▓▓▓░     ▓▓▓▓▓▓     ▒▓▓▓▓▓',
--'▓▒▒▒▒▒▒▒▒▒ ▓░░░░░░░░░░░▓    ░▓▓▓▓▓▓▓▓▓▒          ▒▓           ▓▓░  ▓▓░            ▓▓ ░▓▓            ▒▓▓  ▒▓▓▓▓░    ▓▓▓▓▓   ▒▓▓▓▓▓  ░▓▓▓▓▓      ▒▓▓▓▓▒      ▓▓▓▓▓',
--'▓▓▓▓▓▓▓▓▓▓  ░▒▒▒▒▒▒▒▒▒▒▒▓   ░▓▓▓▓▓▓▓▓▓▒          ▒▓           ░▓░  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒ ▓▓▒             ▓▓   ▓▓▓▓▓   ░▓▓▓▓    ▒▓▓▓▓▓  ░▓▓▓▓▓      ▒▓▓▓▓▒      ▓▓▓▓▓',
--'▓▓▓▓▓▓▓▓▓▓    ▓▒▒▒▒▒▒▒▒▒▒▒░ ░▓▓▓▓▓▓▓▓▓▒          ▒▓           ░▓░  ▓▓░               ▓▓▒             ▓▓░   ▓▓▓▓░ ▒▓▓▓▓░    ▒▓▓▓▓▓  ░▓▓▓▓▓      ▒▓▓▓▓▒      ▓▓▓▓▓',
--'▓░░░░░░░░░     ▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▒          ▒▓           ░▓░  ▓▓▓               ▓▓▓             ▓▓    ░▓▓▓▓▓▓▓▓▓▓     ▒▓▓▓▓▓  ░▓▓▓▓▓      ▒▓▓▓▓▒      ▓▓▓▓▓',
--'▓▒▒▒▒▒▒▒▒▒      ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒          ▒▓           ░▓░   ▓▓░               ▓▓            ▓▓▓     ▒▓▓▓▓▓▓▓▓      ▒▓▓▓▓▓  ░▓▓▓▓▓      ▒▓▓▓▓▒      ▓▓▓▓▓',
--'▓▒▒▒▒▒▒▒▒▒        ░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▒          ▒▓           ░▓░    ▒▓▒         ▒▓    ▓▓▓        ░▓▓░       ▒▓▓▓▓▓▓       ▒▓▓▓▓▓  ░▓▓▓▓▓      ▒▓▓▓▓▒      ▓▓▓▓▓',
--'▓▓▓▓▓▓▓▓▓▓         ▓░░░░░░░░▓▓▓▓▓▓▓▓▓▓▒          ▒▓           ░▓░      ▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓▓▓▓▓▓▓▓░          ▓▓▓▓▓        ▒▓▓▓▓▓  ░▓▓▓▓▓      ▒▓▓▓▓▒      ▓▓▓▓▓',
--'▓▓▓▓▓▓▓▓▓▓           ▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▒                                                                                                                         ',
--'▓▒▒▒▒▒▒▒▒▒            ▓▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▒                                                                                                                         ',
--'  ▓▒▒▒▒▒▒▒             ▒▓▓▓▓▓▓▓▓▓▓▓▓▓                                                                                                                           ',
--'    ▓▒▒▒▒▒              ░▓▓▓▓▓▓▓▓▓▓                                                                                                                             ',
--'      ▓▒▒▒                ▒▒▓▓▓▓▓                                                                                                                               ',
--'        ▓▓                 ▒▓▓▒                                                                                                                                 ',
--
--'         WK0KN                   WX0XW                                                                                     ',
--'       WKOxxk0N                  W0xxOXW                                                                                   ',
--'     WKOxxxxkOOXW                W0dddx0XW                                                                                 ',
--'   WKOxxxxxxkkkOKW               W0dooodxOXW                                                                               ',
--' WKkxddddddxkkkkk0NW             W0dooooooxOXW                                                                             ',
--'KkdooddddddxkkkkkkOXW            W0dooooooooxON                                                                            ',
--'xdddoodddddxkkkkkkkOKW           W0dooooooooooON                                                                           ',
--'xddddoooddddxkkkkkkkk0N          W0dooooooooookN   NKKKKXN            NXKKKXWWNXXXXNW  WXXXXN   WXK000XW      NXK000KXW    ',
--'doooooooodddxkkkkkkkkkOXW        W0oolllllooookN  W0c;,,;oK          Kl;;;;dX0c::::dX  Kl;;;l0Kxl:,,,,;lkN N0dc;,,,,,:lxKW ',
--'doooooooooodxxxkxkkxxxxkKW       W0ollllllllllkN   Wx;```,dN        Xo````c0WO;````lX  0:```,:;``,,,````,oko,``,;,,`````:kN',
--'doooooooooloxxxxxxxxxxxxk0N      W0ollllllllllkN    Nd,```;kW      Nx,```;OW k;````lX  0:`````:dO0KKkl,```,`,cx0KKOd;````;k',
--'doooooooooodOkxxxxxxxxxxxxOXW    W0ollllllllllxN     Xl````:0     WO;```,xN  k;````lX  0:````:0W     Xl`````lK     Wk;````l',
--'dooooooooooxXXOxxxxxxxxxxxxkKW   W0ollllllllllxN      0c````lX    Kc```,oN   k;````lX  0:````cX      Wd````,xW      0:````c',
--'dooooooooooxXWXOxxxxxxxxxxxxk0N  W0ollllllllllxN      WO;```,xN  Xo,```lK    k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'dlllooooollxX  N0kxxxxxxxxxxxxOXWW0occccccccccxX       Nx,```;OWWx,```:0     k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX   WKkxxxxxxxxxxxxkKW0lccccccccccxX        Xo,```lKO:```;kW     k;````lX  0:````cX      Wd,```,xW      K:````c',
--'ollllllllllxX    WXOxddxddddddxdx0klccccccccccdX         Kl```,ol```,xN      k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX      N0xdddddddddddxdlccccccccccdX         W0:```,,``,oX       k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX       WKkdddddddddddolccccccccccdX          Wk;``````cK        k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX        WXkddddddddddollccc:::cccdX           Nd,````:OW        k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX          NOdddddddddolllcc::::::dX            N0kkkOKW         XkxxxxON  NOxxxxON      WKxxxxkKW      NOxxxxO',
--'occccccccccdX           W0xdddddddollllcc:::::dX                                                                           ',
--'xlcccccccccdX            WKkddddddolcccccc:::ckN                                                                                                                                                 ',
--'N0dlcccccccdX             WXOdoddoolccccccccdKW                                                                                                                                                  ',
--'  N0dlcccccdX               N0dooolcccccclxKW                                                                                                                                                    ',
--'    N0dccccdX                WKxoolcccclxKW                                                                                                                                                      ',
--'      N0dc:dX                 WXkolcclxKW                                                                                                                                                        ',
--'        N0ddX                   NOolx0N                                                                                                                                                          ',
--'         WX0N                    NOONW                                                                                                                                                           ',
--
--'         WK0KN                   WX0XW                                                                                                                                                           ',
--'       WKOxxk0N                  W0xxOXW                                                                                                                                                         ',
--'     WKOxxxxkOOXW                W0dddx0XW                                                                                                                                                       ',
--'   WKOxxxxxxkkkOKW               W0dooodxOXW                                                                                                       NK0000XW                                      ',
--' WKkxddddddxkkkkk0NW             W0dooooooxOXW                                                                                                     O:,,,,oX                                      ',
--'KkdooddddddxkkkkkkOXW            W0dooooooooxON                                                                                                   Wk;````lX                                      ',
--'xdddoodddddxkkkkkkkOKW           W0dooooooooooON                                                                                                   XOkkkk0W                                      ',
--'xddddoooddddxkkkkkkkk0N          W0dooooooooookN                                                                         NKKKKXN            NXKKKXWWNXXXXNW  WXXXXN   WXK000XW      NXK000KXW    ',
--'doooooooodddxkkkkkkkkkOXW        W0oolllllooookN     Xk0W WXOxddoodxOXW         WXOxxdddxxk0NW          WKOxddooddxOXW  W0c;,,;oK          Kl;;;;dX0c::::dX  Kl;;;l0Kxl:,,,,;lkN N0dc;,,,,,:lxKW ',
--'doooooooooodxxxkxkkxxxxkKW       W0ollllllllllkN     O;oK0xdxkO00Oko:cxN      NOoloxO0KK0OxdookX      XklcoxkOOOOxdc:oON Wx;```,dN        Xo````c0WO;````lX  0:```,:;``,,,````,oko,``,;,,`````:kN',
--'doooooooooloxxxxxxxxxxxxk0N      W0ollllllllllkN     O;;ox0N       W0l;dN    Ko:dKW        W0xol0W  W0c:dKW       WNOc;oK Nd,```;kW      Nx,```;OW k;````lX  0:`````:dO0KKkl,```,`,cx0KKOd;````;k',
--'doooooooooodOkxxxxxxxxxxxxOXW    W0ollllllllllxN     O;;kW           0:;O   Kl;xW            WKllK W0:;kW            Kl,lK Xl````:0     WO;```,xN  k;````lX  0:````:0W     Xl`````lK     Wk;````l',
--'dooooooooooxXXOxxxxxxxxxxxxkKW   W0ollllllllllxN     k;cK            Xl,xW Wx,lKWWWWWWWWWWWWWWNd:kWXl,dN              0:,dN 0c````lX    Kc```,oN   k;````lX  0:````cX      Wd````,xW      0:````c',
--'dooooooooooxXWXOxxxxxxxxxxxxk0N  W0ollllllllllxN     k;cK            No,dW Xl`:ooooooooooooooooc:kW0:;O               Xo`cK WO;```,xN  Xo,```lK    k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'dlllooooollxX  N0kxxxxxxxxxxxxOXWW0occccccccccxX     k;cK            No,xW Kc,dKXXXXXXXXXXXXXXXXXW O;:0               Nd`cK  Nx,```;OWWx,```:0     k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX   WKkxxxxxxxxxxxxkKW0lccccccccccxX     k;cK            No,dW Xo,xW                   0:;O               No`cK   Xo,```lKO:```;kW     k;````lX  0:````cX      Wd,```,xW      K:````c',
--'ollllllllllxX    WXOxddxddddddxdx0klccccccccccdX     k;cK            No,dW Wk;cK                   Xl,xW              0c,dN    Kl```,ol```,xN      k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX      N0xdddddddddddxdlccccccccccdX     k;cK            No,dW  Xo;oX                  WO::OW            Xo,cK     W0:```,,``,oX       k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX       WKkdddddddddddolccccccccccdX     k;cK            No,dW   Xd:lON         WNXO0W  WOcckX         WKo;lKW      Wk;``````cK        k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX        WXkddddddddddollccc:::cccdX     k;cK            No,dW    W0ocldkO000OkdolloOW    Xxlldk0KXKKOxoclkN         Nd,````:OW        k;````lX  0:````cX      Wd,```,xW      Kc````c',
--'ollllllllllxX          NOdddddddddolllcc::::::dX     KxkN            WOd0W      WXOxdoooddxk0KXW        NKkxddddddxOKW            N0kkkOKW         XkxxxxON  NOxxxxON      WKxxxxkKW      NOxxxxO',
--'occccccccccdX           W0xdddddddollllcc:::::dX                                      WW                     WWW                                                                                 ',
--'xlcccccccccdX            WKkddddddolcccccc:::ckN                                                                                                                                                 ',
--'N0dlcccccccdX             WXOdoddoolccccccccdKW                                                                                                                                                  ',
--'  N0dlcccccdX               N0dooolcccccclxKW                                                                                                                                                    ',
--'    N0dccccdX                WKxoolcccclxKW                                                                                                                                                      ',
--'      N0dc:dX                 WXkolcclxKW                                                                                                                                                        ',
--'        N0ddX                   NOolx0N                                                                                                                                                          ',
--'         WX0N                    NOONW                                                                                                                                                           ',

       --"███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
       --"████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
       --"██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
       --"██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
       --"██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
       --"╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",

