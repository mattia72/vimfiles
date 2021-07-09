--
-- lua config file for dashboard 
--
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_session_directory = "~/.cache/session"
vim.g.dashboard_custom_header = {
       "███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
       "████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
       "██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
       "██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
       "██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
       "╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      }

vim.cmd([[
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
"nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
"nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
"nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
"nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
]])

vim.g.dashboard_custom_section = {
    a = {description = {'  Delphi                            '}, command = 'so ~/delphi-dev.vim | so ~/Session.vim'},
    b = {description = {'  Reload Last Session            ,sl'}, command = 'SessionLoad'},
    c = {description = {'  Recently Opened Files          ,fm'}, command = 'Telescope oldfiles'},
    d = {description = {'  Open Project                      '}, command = 'Telescope marks'},
    e = {description = {'  Jump to Bookmark                  '}, command = 'Telescope project'},
    f = {description = {'  Find File                      ,ff'}, command = 'Telescope find_files'},
    g = {description = {'  Find Word                      ,fa'}, command = 'Telescope live_grep'},
    h = {description = {'  Open Neovim Configuration      ,vi'}, command = ':tabnew! ~/.vim/vim.vimrc'}
}

