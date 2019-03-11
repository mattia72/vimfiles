" Gui settings for neovim

if filereadable(expand("~/.vim/gui_settings.vimrc"))
  source ~/.vim/gui_settings.vimrc
else
  echom 'There is no gui settings for neovim'
endif