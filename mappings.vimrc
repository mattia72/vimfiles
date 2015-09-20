
"-------------------------------------------------------------------------------
" Mappings ...
"-------------------------------------------------------------------------------

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Don't use Ex mode, use Q for formatting
noremap Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" With a noremap leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Most recent file list
nnoremap <F3> :Unite file_mru<cr>

" Copy full path or file name to clipboard
nnoremap <leader>cp :let @+ = expand("%:p")<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>

" Fast saving
"nnoremap <leader>s :w!<cr>
" Window operation
nnoremap <leader>w <C-W>
" Diff jumps
nnoremap <leader>dp [c
nnoremap <leader>dn ]c
" Spell jumps: next previous error
nnoremap <leader>sp [s
nnoremap <leader>sn ]s
" Fast editing of the vimrc
noremap <leader>e :tabnew! ~\.vim\vimrc<cr>
" jump to tag
nnoremap <leader>j <C-]>
" find word under cursor in the current directory
nnoremap <leader>vg <ESC>:vimgrep <C-R><C-W> *.
" search replace selected whole word
nnoremap <leader>srw <ESC>:%s/\<<C-R><C-W>\>//g<Left><Left><BackSpace>/
" search replace selected word
nnoremap <leader>sr <ESC>:%s/<C-R><C-W>//g<Left><Left><BackSpace>/
" search replace selected
vnoremap <leader>sr y<ESC>:%s/<C-R>0//g<Left><Left><BackSpace>/
"reload syntax
nnoremap <leader>sy :syn on
" habit: edit for other editors
nnoremap <leader>eo :set tw=0 wrap linebreak
" find form name in forms xml
"nnoremap <leader>vf <ESC>:vimgrep <C-R><C-W>  ../**/*.inc ../**/*.ddl ../**/*.mdd
" Clear search highlight
nnoremap <leader><space> :noh<cr>
" Folding...
nnoremap <leader>fs :call <SID>MyFoldSyntax()<cr>
function! <SID>MyFoldSyntax()
  set foldmethod=syntax
  set foldcolumn=1
  set foldlevel=1
endfunction
nnoremap <leader>fm :set foldmethod=manual<cr>
" foldlevel increase/decrease
nnoremap <leader>fi :set foldlevel-=1<cr>
nnoremap <leader>fd :set foldlevel+=1<cr>
nnoremap <leader>fc :call <SID>MyFoldColumn()<cr>
function! <SID>MyFoldColumn()
  if &foldcolumn > 0
    set foldcolumn=0
  else
    set foldcolumn=1
  endif
endfunction
" load all file from quickfix window
nnoremap <leader>lq :cfirst <bar> while 1 <bar> cnext <bar> endwhile <cr>
" close a buffer
nnoremap <leader>bd :bdelete <cr>
" close all buffer
nnoremap <leader>bda :bufdo bdelete <cr>
" Tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab> :tabnext<CR>
noremap <C-S-tab> :tabprevious<CR>
noremap <C-tab> :tabnext<CR>
inoremap <C-S-tab> <esc>:tabprevious<CR>i
inoremap <C-tab> <esc>:tabnext<CR>i
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <esc>:tabnew<CR>
"nnoremap <F3> n
"nnoremap <S-F3> N
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

" autocomplete parenthesis, (brackets) and braces
inoremap  (  ()<Left>
inoremap  [  []<Left>
inoremap  {  {}<Left>
" surround selected text
vnoremap  (  s()<Esc>P<Right>%
vnoremap  [  s[]<Esc>P<Right>%
vnoremap  {  s{}<Esc>P<Right>%

