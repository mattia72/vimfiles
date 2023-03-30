
let g:verbose = 0
function! g:VerboseEchoMsg(msg)
  if g:verbose | echom a:msg | endif
endfunc

let s:fname = resolve(expand('<sfile>:t'))

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
function! <SID>SetWhiteSpacesVisible()
  set listchars=eol:¬,tab:» ,trail:~,extends:>,precedes:<,space:.
  set list
endfunction

command! -nargs=0 MySetWhiteSpaceVisible call <SID>SetWhiteSpacesVisible()

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
