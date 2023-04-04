" Gui settings for neovim

"if !exists("g:load_init_lua_only")
  "finish
"endif

let g:init_root_dir=getenv('XDG_CONFIG_HOME').'\nvim\'
exec 'cd '.g:init_root_dir

if filereadable("gui_settings.vimrc") 
  source gui_settings.vimrc
else
  echom 'There is no gui_settings.vimrc for neovim'
endif
