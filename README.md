# vimfiles
This is a collection of my vim setting files.

## Vim download
With lua support
https://tuxproject.de/projects/vim/

## Usage
1. Clone this repository to your .vim directory
2. Create a _vimrc file in your home directory with this content: 
    `source ~/.vim/vimrc`
3. Start vim
4. Enjoy :)

## Content

### README.md 
 Description of the repository

### autocmds.vimrc 
 Autocommand collection

### colors.vimrc 
 Color settings for gui and terminal:
```vim
 if has("gui_running")
   colors my_molokai
 else
   colors wombat256
 endif
```

### mappings.vimrc 
 Mappings. Here are some examples:
 ```vim
 " Tab navigation like firefox
 nnoremap <C-S-tab> :tabprevious<CR>
 nnoremap <C-tab> :tabnext<CR>
 noremap <C-S-tab> :tabprevious<CR>
 noremap <C-tab> :tabnext<CR>
 inoremap <C-S-tab> <esc>:tabprevious<CR>i
 inoremap <C-tab> <esc>:tabnext<CR>i
 nnoremap <C-t> :tabnew<CR>
 inoremap <C-t> <esc>:tabnew<CR>
 " Command line
 cnoremap <C-A> <Home>
 cnoremap <C-E> <End>
 cnoremap <C-N> <Down>
 cnoremap <C-P> <Up>
 " Move up/down single line with Ctrl+Arrow
 nnoremap <C-Up> [e
 nnoremap <C-Down> ]e
 " Move up/down multiple lines with Ctrl+Arrow
 vnoremap <C-Up> [egv
 vnoremap <C-Down> ]egv
 " Visually select the text that was last edited/pasted
 nnoremap gV `[v`]
 ```

### dein.vmrc
 Plugin management

### settings.vimrc 
 Vim settings

### vimrc 
 This is the central vimrc file. It calls the other vimrc-s eg: 
```vim
  if filereadable(expand("~/.vim/dein.vimrc"))
    source ~/.vim/dein.vimrc
  endif
```
It contains the settings of various plugins also.

### my-faq.txt 
My faq in vimhelp format. In vim `:help my-faq`

