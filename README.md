# vimfiles
This is a collection of my vim setting files.

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
 Color settings 

### mappings.vimrc 
 Mappings

### neobundle.vimrc 
 Plugin management

### settings.vimrc 
 Vim settings

### vimrc 
 This is the central vimrc file. It calls the other vimrc-s eg: 
```vim
  if filereadable(expand("~/.vim/neobundle.vimrc"))
    source ~/.vim/neobundle.vimrc
  endif
```
It contains the settings of various plugin files also.

### my-faq.txt 
My faq in vimhelp format. In vim `:help my-faq`

