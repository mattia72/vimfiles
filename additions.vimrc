
let g:verbose = 0
function! g:VerboseEchoMsg(msg)
  if g:verbose | echom a:msg | endif
endfunc

let s:fname = resolve(expand('<sfile>:t'))

"=====[ Highlight matches when jumping to next ]=============
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call <SID>HLNext(0.4)<cr>
nnoremap <silent> N   N:call <SID>HLNext(0.4)<cr>


" blink the line containing the match...
function! <SID>HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
function! <SID>SetWhiteSpacesVisible()
  set listchars=eol:¬,tab:» ,trail:~,extends:>,precedes:<,space:.
  set list
endfunction

command! -nargs=0 MySetWhiteSpaceVisible call <SID>SetWhiteSpacesVisible()

"====[ Function to permanently delete views created by 'mkview' ]======

function! <SID>MyDeleteView()
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

function! g:MyExecInCmd(command, ...)
  let tmp=&shell
  set shell=cmd
  call common#MyEchoModeMsg(s:fname, 'Exceute in cmd shell: '.a:command.' '.join(a:000))
  execute '!'.a:command.' '.join(a:000)
  let &shell=tmp
endfunction

command! -nargs=+ -complete=command MyExecInCmd call MyExecInCmd(<q-args>)

"----------------------------
function! <SID>MySaveFileFormat(type)
  let file = fnamemodify(bufname('%'),':t')
  execute 'write ++fileformat='.a:type
  call common#MyEchoModeMsg(s:fname, file.' saved in '.a:type.' format.')
endfunction

function! GetFileFormats(ArgLead, CmdLine, CursorPos)
  return split('dos|unix|mac', '|')
endfunction

command! -nargs=1 -complete=customlist,GetFileFormats MySaveFileFormat call <SID>MySaveFileFormat(<q-args>)
"----------------------------

function! <SID>CommandToTab(cmd)
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
command! -nargs=+ -complete=command MyCommandToTab call <SID>CommandToTab(<q-args>)

" # Command Delview (and it's abbreviation 'delview')
command! MyDelview call <SID>MyDeleteView()
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
