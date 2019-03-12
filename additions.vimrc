
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
  exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~" 
  ",eol:$"
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
command! -nargs=+ -complete=command CommandToTab call CommandToTab(<q-args>)

" # Command Delview (and it's abbreviation 'delview')
command! Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>

"grep operator from "Learn Vim script the hard way"
"
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " *.*"<cr>:copen<cr>

