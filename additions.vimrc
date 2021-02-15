
let g:verbose = 0
function! g:VerboseEchoMsg(msg)
  if g:verbose | echom a:msg | endif
endfunc

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>


" blink the line containing the match...
function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
function! SetWhiteSpacesVisible()
  set listchars=eol:¬,tab:» ,trail:~,extends:>,precedes:<,space:.
  set list
endfunction

"====[ Function to permanently delete views created by 'mkview' ]======

function! MyDeleteView()
  let path = fnamemodify(bufname('%'),':p')
  " vim's odd =~ escaping for /
  let path = substitute(path, '=', '==', 'g')
  if empty($HOME)
  else
    let path = substitute(path, '^'.$HOME, '\~', '')
  endif
  let path = substitute(path, '/', '=+', 'g') . '='
  " view directory
  let path = &viewdir.'/'.path
  call delete(path)
  echo "Deleted: ".path
endfunction

function! g:MySetDefaultShell()
  let g:default_shell_options =[&shell, &shellquote, &shellpipe, &shellxquote, &shellcmdflag, &shellredir]
	set shellquote& | set shellpipe& | set shellxquote& | set shellcmdflag& | set shellredir& | set shell&
endfunction

function! g:MyRestoreOrigShell()
  let &shell        = g:default_shell_options[0]
  let &shellquote   = g:default_shell_options[1]
  let &shellpipe    = g:default_shell_options[2]
  let &shellxquote  = g:default_shell_options[3]
  let &shellcmdflag = g:default_shell_options[4]
  let &shellredir   = g:default_shell_options[5]
endfunction

command!  MySetDefaultShell call MySetDefaultShell()
command!  MyRestoreOrigShell call MyRestoreOrigShell()

function! g:MyExecInCmd(command, ...)
  let tmp=&shell
  set shell=cmd
	echohl ModeMsg | echo '[vimplug.vimrc] Exceute in cmd shell: '.a:command.' '.join(a:000," ") | echohl None
  execute a:command join(a:000," ")
  let &shell=tmp
endfunction

command! -nargs=+ -complete=command MyExecInCmd call MyExecInCmd(<q-args>)

function! CommandToTab(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

" Example :CommandToTab highlight
" Example :CommandToTab verbose map
command! -nargs=+ -complete=command MyCommandToTab call CommandToTab(<q-args>)

" # Command Delview (and it's abbreviation 'delview')
command! MyDelview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'MyDelview' : 'delview')<CR>
"-------------------------------------------------------------------------------
" For syntax development
"-------------------------------------------------------------------------------
nnoremap <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Refresh syntax highlight
nnoremap <F12> <Esc>:syntax sync fromstart<CR>
"nnoremap <S-F12> <Esc>:so ~/dev/vim/delphi.vim/syntax/hitest.vim<CR>
"
" Show syntax highlighting groups for word under cursor: Ctrl Shift P
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <C-S-F12> :call <SID>SynStack()<CR>
"-------------------------------------------------------------------------------
" Session loading...
"-------------------------------------------------------------------------------
let g:my_vim_session = "~/Session.vim"

fu! SaveSession()
  execute 'mksession! ' . g:my_vim_session
endfunction

fu! RestoreSession()
  let file = expand(g:my_vim_session)
  if filereadable(file)
    execute 'source ' . g:my_vim_session
  endif
endfunction

" autocmd VimLeave * call SaveSess()
" only restore the session if the user has -not- requested a specific filename
" doesn't work with Obsession together :(
" autocmd VimEnter * if !argc() | call RestoreSession() | endif
 
