--
-- lua config file for alpha 
--

local function footer()
  local plugin_count = 0;

  if packer_plugins ~= nil then
    local u = require('utils')
    count, count_cond = u.table_count(packer_plugins, function(val) return val.loaded end)
    plugin_count = count_cond..'/'..count
  else if  vim.g.plugs ~= nil then
    --plugin_count = vim.call('len', vim.g.plugs)
    plugin_count = #vim.g.plugs
    end
  end
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  local version = vim.version()
  --local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
  local plugins  =  " neovim loaded " .. plugin_count .. " plugins."

  --return datetime .. "   " .. plugin_count .. " plugins" .. nvim_version_info
  return datetime .. ' ' .. plugins
end

local function get_last_session()
  local dir = require("possession.config").session_dir 
  local session_name=''
  -- how to get last???
  for file in io.popen('dir '.. dir .. '\\*.json /b /od'):lines()  do 
    session_name = string.gsub(file, '.json', '')
  end
  return session_name
end

local version = vim.version()
local icon_color = "Function"

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
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
'    ░░░░           ▓▓▓▓▓▓▓         ' .. ' ' .. version.major .. '.' .. version.minor .. '-' .. version.patch          ,
'      ░▒            ░▓▓▓                                                                                              ',
}
--dashboard.section.header.opts.hl = 'PreProc'
dashboard.section.header.opts.hl = 'Comment'
                                          
dashboard.section.buttons.val = {
  --{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
  --{ type = "padding", val = 1 },
  dashboard.button('e'          , "  New File                  " , ':ene <BAR> startinsert <CR>'                 )  ,                
  dashboard.button('d'          , "  Delphi                    " , ':so ~/delphi-dev.vim | PossessionLoad delphi-dev<CR>' )  ,                
  dashboard.button('r'          , "  Reload Last Session       " , ':PossessionLoad '..get_last_session()..'<CR>')  ,                
  dashboard.button('<leader>tr' , "  Recently Opened Files     " , ':Telescope oldfiles<CR>'                     )  ,                
  dashboard.button('o'          , "  Open Project              " , ':Telescope possession list<CR>' ),                
  dashboard.button('<leader>ta' , "  Jump to Bookmark          " , ':Telescope marks<CR>'                        )  ,                
  dashboard.button('<leader>tf' , "  Find File                 " , ':Telescope find_files<CR>'                   )  ,                
  dashboard.button('<leader>tg' , "  Find Word                 " , ':Telescope live_grep<CR>'                    )  ,                
  dashboard.button('<leader>th' , "  Search Help               " , ':Telescope help_tags<CR>'                    )  ,                
  dashboard.button('<leader>vi' , "  Open Neovim Configuration " , ':tabnew! $MYVIMRC<CR>'                       )  ,                
  dashboard.button('q'          , "⏻  Quit                      " , ':q<CR>'                                      )  ,                
}                                                                                                                     
dashboard.section.buttons.opts.hl_shortcut = 'Title'

dashboard.section.footer.val = footer()
--dashboard.section.footer.opts.hl = "Constant"
dashboard.section.footer.opts.hl = "Comment"

alpha.setup(dashboard.opts)

vim.cmd([[ 
autocmd FileType alpha setlocal nofoldenable nornu nonu 
]])
--vim.cmd [[ echohl ModeMsg | echo '[plug-alpha] hallo' | echohl None ]]
--
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

