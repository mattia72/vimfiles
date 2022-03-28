--
-- lua config file for dashboard 
--

vim.g.dashboard_default_executive = 'telescope'
--vim.g.dashboard_session_directory = "~/.cache/session"
--vim.cmd("let g:dashboard_session_directory = $HOME..'/.cache/nvim/.sessions'")

--nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
--vim.api.nvim_set_keymap('n', '<leader>ff', ':DashboardFindFile<CR>', { noremap = true, silent = true })
--"nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
--"nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
--nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
--vim.api.nvim_set_keymap('n', '<leader>fa', ':DashboardFindWord<CR>', { noremap = true, silent = true })
--"nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
--"nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
vim.api.nvim_set_keymap('n', '<leader>ss', ':<C-u>SessionSave<CR>', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ss', ':<C-u>SessionSave<CR>', { noremap = false, silent = true })

vim.api.nvim_exec([[
function! MySetDashboardColor()
  hi dashboardHeader    guifg=#0087d7
  hi dashboardFooter    guifg=#008f00
  hi dashboardCenter    guifg=#ffaf00
  hi dashboardShortCut  guifg=#00d700
endfunction

autocmd User dashboardReady call  MySetDashboardColor()
]], false)
vim.g.dashboard_custom_section = {
    a = {description = {'  New File                          '}, command = 'DashboardNewFile'},
    b = {description = {'  Delphi                            '}, command = 'so ~/delphi-dev.vim | so ~/Session.vim'},
    c = {description = {'  Reload Last Session            ,sl'}, command = 'SessionLoad'},
    d = {description = {'  Recently Opened Files          ,fr'}, command = 'Telescope oldfiles'},
    --d = {description = {'  Open Project                      '}, command = 'Telescope ???'},
    e = {description = {'  Jump to Bookmark                  '}, command = 'Telescope marks'},
    f = {description = {'  Browse File                       '}, command = 'Telescope file_browser'},
    g = {description = {'  Find File                      ,ff'}, command = 'Telescope find_files'},
    h = {description = {'  Find Word                      ,fa'}, command = 'Telescope live_grep'},
    i = {description = {'  Search Help                    ,fh'}, command = 'Telescope help_tags'},
    j = {description = {'ﭻ  Key Mappings                   ,fp'}, command = 'Telescope keymaps'},
    k = {description = {'  Open Neovim Configuration      ,vi'}, command = ':tabnew! ~/.vim/vimrc'}
}


 vim.g.dashboard_custom_header = {
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

      }
