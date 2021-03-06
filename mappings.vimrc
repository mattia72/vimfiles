"=============================================================================
" File:          mappings.vimrc
" Author:        Mattia72 
" Description:   Key binding definitions for VIM
" Created:       21 okt. 2015
"=============================================================================

"-------------------------------------------------------------------------------
" Mappings ...
"-------------------------------------------------------------------------------

let s:fname = resolve(expand('<sfile>:t'))
function! <SID>MyEchoMessage(msg)
    echohl StatusLineNC | echo s:fname.': '.a:msg | echohl None
endfunction


"Ctrl-C, Ctrl-V and so on...
source $VIMRUNTIME/mswin.vim
" remap old C-V in normal mode
nnoremap <C-V> <C-Q>

" Auto indent pasted text
if ! has('nvim') 
  nnoremap p p=`]<C-o>
  nnoremap P P=`]<C-o>
endif

" Don't use Ex mode, use Q for paragraph formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" With a noremap leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Copy full path or file name to clipboard
nnoremap <leader>cp :let @+ = expand("%:p")<cr>:call <SID>MyEchoMessage('Path of current file was copied to clipboard.')<CR>
nnoremap <leader>cf :let @+ = expand("%")<cr>:call <SID>MyEchoMessage('Name of current file was copied to clipboard.')<CR>

"got to dir of current file in current window only
nnoremap <leader>cd <ESC>:lcd %:p:h <bar> pwd <CR>


" simple buffer explorer, after :sb works tab completition 
" sb tries to find buffer in opened windows and switches to it
nnoremap <leader>sb :ls<cr>:sb<space>
" simple buffer explorer, after :b works tab completition 
nnoremap <leader>b :ls<cr>:b<space>

" same as above with split, if not open
nnoremap <leader>vb :ls<cr>:vertical sb<space>
nnoremap <leader>hb :ls<cr>:sb<space>
" run selected as cmd
vnoremap <leader>rs <ESC>y:<C-R>0

" Fast saving
"nnoremap <leader>s :w!<cr>
" Window operation
nnoremap <leader>w <C-W>
if has('nvim')                 " tnoremap stands for terminal mode mappings in neovim
  tnoremap <Esc> <C-\><C-n>   
  tnoremap <c-h> <C-\><C-N><C-w>h
  tnoremap <c-j> <C-\><C-N><C-w>j
  tnoremap <c-k> <C-\><C-N><C-w>k
  tnoremap <c-j> <C-\><C-N><C-w>j
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
  command! MyPwsh :call MySetPowerShell()|:term
  cabbrev pwsh MyPwsh
  command! Cmd :call MySetDefaultShell()|:term
  cabbrev cmd MyCmd
  nnoremap <leader>tt :vsplit<CR><C-W>L:MyPwsh<CR>:MySetDefaultShell<CR>
  nnoremap <leader>tc :vsplit<CR><C-W>L:MyCmd<CR>
endif
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <leader>om :CommandToTab message<cr>

" Diff this with other file
nnoremap <leader>ds :vertical diffsplit 
" Diff this with other 
nnoremap <leader>dt :diffthis<CR>:vnew<CR>
" Diff jumps
nnoremap <leader>dk [c
nnoremap <leader>dj ]c
" Spell jumps: next previous error
nnoremap <leader>sp [s
nnoremap <leader>sn ]s
" Fast editing of the vimrc
noremap <leader>vi :tabnew! ~/.vim/vimrc<cr>
" jump to tag
nnoremap <leader>j <C-]>

" find all word under cursor in the current directory
nnoremap <leader>fa <ESC>:RipGrep -w <C-R><C-W> %<Left><Left>
nnoremap <leader>fA <ESC>:RipGrep -w <C-R><C-W> 
" find all selected
vnoremap <leader>fa y<ESC>:RipGrep <C-R>0 %<Left><Left>
vnoremap <leader>fA y<ESC>:RipGrep <C-R>0

" search replace selected whole word
nnoremap <leader>sR <ESC>:%s/\<<C-R><C-W>\>//g<Left><Left><BackSpace>/
" search replace selected whole word case sensitive
nnoremap <leader>sRC <ESC>:%s/\C\<<C-R><C-W>\>//g<Left><Left><BackSpace>/
" search replace line containing selected word
nnoremap <leader>srl <ESC>:%s/.*<C-R><C-W>.*//g<Left><Left><BackSpace>/
" search replace selected word
nnoremap <leader>sr <ESC>:%s/<C-R><C-W>//g<Left><Left><BackSpace>/
" search replace selected word case sensitive
nnoremap <leader>src <ESC>:%s/\C<C-R><C-W>//g<Left><Left><BackSpace>/
" search replace selected
vnoremap <leader>sr y<ESC>:%s/<C-R>0//g<Left><Left><BackSpace>/
" search replace selected case sensitive
vnoremap <leader>src y<ESC>:%s/\C<C-R>0//g<Left><Left><BackSpace>/

" copy selected to clipboard
vnoremap <leader>yy "+y:call <SID>MyEchoMessage('The selected text was copied to clipboard.')<CR>
" paste selected to clipboard
nnoremap <leader>pp "+p

" highlight selected
vnoremap <leader>sh y<ESC>:match Error /<C-R>0/ 
"reload syntax
nnoremap <leader>sy :syn off<CR>:syn on<CR>
" habit: edit for other editors
nnoremap <leader>eo :set tw=0 wrap linebreak
" Clear search highlight
nnoremap <leader><space> :noh<cr>
" Folding...
nnoremap <leader>fs :call <SID>MyFoldSyntax()<cr>
"work with an xml..
"nnoremap <leader>xm :setfiletype xml<cr> :call <SID>MyFoldSyntax()<CR>ggVG=
"xml formatting
nnoremap <leader>xf Go<esc>:r ! xmllint --format %<cr>

"open file under cursor in vsplit window
nnoremap <leader>gf <C-W>vgf<C-W>L
vnoremap <leader>gf <C-W>vgf<C-W>L

function! <SID>MyFoldSyntax()
  set foldmethod=syntax
  set foldcolumn=1
  set foldlevel=1
endfunction

nnoremap <leader>fm :set foldmethod=manual<cr>
"
" foldlevel increase/decrease " so works with number prefix
nnoremap <leader>fi :<C-u>let &foldlevel-=(v:count)?(v:count):1<cr>
nnoremap <leader>fd :<C-u>let &foldlevel+=(v:count)?(v:count):1<cr>

nnoremap <leader>fc :call <SID>MyShowFoldIndicatorColumn()<cr>
function! <SID>MyShowFoldIndicatorColumn()
  if &foldcolumn > 0
    set foldcolumn=0
  else
    set foldcolumn=1
  endif
endfunction

" load all file from quickfix window
nnoremap <leader>lq :cfirst <bar> while 1 <bar> cnext <bar> endwhile <cr>

" close help window
nnoremap <leader>hq :helpclose <cr>
" close quickfix window
nnoremap <leader>cq :cclose <cr>
" close all, except current buffer
nnoremap <leader>ba :w <bar> %bd <bar> e# <bar> bd# <CR>
" Tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab> :tabnext<CR>
noremap <C-S-tab> :tabprevious<CR>
noremap <C-tab> :tabnext<CR>
inoremap <C-S-tab> <esc>:tabprevious<CR>i
inoremap <C-tab> <esc>:tabnext<CR>i
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <esc>:tabnew<CR>        
inoremap <S-Tab> <C-V><Tab>
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
" Select all and increment numbers
nnoremap <C-y> <C-a>
nnoremap <C-x> <C-x>
"handled by mswin.vim
"nnoremap <C-A> ggVG 
"
" autocomplete parenthesis, (brackets) and braces
"inoremap  (  ()<Left>
"inoremap  [  []<Left>
"inoremap  {  {}<Left>
" surround selected text
vnoremap  (  s()<Esc>P<Right>%
vnoremap  [  s[]<Esc>P<Right>%
vnoremap  {  s{}<Esc>P<Right>%

" Helptags should be rebuild if doc changed
nnoremap <leader>ht :Helptags<CR>

" abbreviations
iabbrev <expr> 2dd  strftime("%d.%m.%Y")
iabbrev <expr> 2dm  strftime("%Y.%m.%d")


