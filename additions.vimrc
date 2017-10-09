
"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>


" EITHER blink the line containing the match...
function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

"" OR ELSE ring the match in red...
"function! HLNext (blinktime)
  "highlight RedOnRed ctermfg=red ctermbg=red
  "let [bufnum, lnum, col, off] = getpos('.')
  "let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  "echo matchlen
  "let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
        "\ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
        "\ . '\|'
        "\ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
        "\ . '\|'
        "\ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
  "let ring = matchadd('RedOnRed', ring_pat, 101)
  "redraw
  "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  "call matchdelete(ring)
  "redraw
"endfunction

"" OR ELSE briefly hide everything except the match...
"function! HLNext (blinktime)
  "highlight BlackOnBlack ctermfg=black ctermbg=black
  "let [bufnum, lnum, col, off] = getpos('.')
  "let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  "let hide_pat = '\%<'.lnum.'l.'
        "\ . '\|'
        "\ . '\%'.lnum.'l\%<'.col.'v.'
        "\ . '\|'
        "\ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
        "\ . '\|'
        "\ . '\%>'.lnum.'l.'
  "let ring = matchadd('BlackOnBlack', hide_pat, 101)
  "redraw
  "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  "call matchdelete(ring)
  "redraw
"endfunction

"" OR ELSE just highlight the match in red...
"function! HLNext (blinktime)
  "let [bufnum, lnum, col, off] = getpos('.')
  "let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  "let target_pat = '\c\%#\%('.@/.'\)'
  "let ring = matchadd('WhiteOnRed', target_pat, 101)
  "redraw
  "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  "call matchdelete(ring)
  "redraw
"endfunction


"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~" 
",eol:$"
set list

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

" # Command Delview (and it's abbreviation 'delview')
command! Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>

