
let s:fname = resolve(expand('<sfile>:t'))

function! g:MySetPowerShell()
  "let &shell = has('win32') ? 'powershell' : 'pwsh'
  let g:default_shell_options =[&shell, &shellquote, &shellpipe, &shellxquote, &shellcmdflag, &shellredir]
  set shell=pwsh
  set shellquote= shellpipe=\| shellxquote=
  set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
  set shellredir=\|\ Out-File\ -Encoding\ UTF8
  call common#MyEchoModeMsg(s:fname, 'PowerShell has been set. (You can restore orig with MyRestoreOrigShell)')
endfunction

function! g:MySetDefaultShell()
  let g:default_shell_options =[&shell, &shellquote, &shellpipe, &shellxquote, &shellcmdflag, &shellredir]
  set shellquote& | set shellpipe& | set shellxquote& | set shellcmdflag& | set shellredir& | set shell&
  call common#MyEchoModeMsg(s:fname, 'Default shell has been set. (You can restore orig with MyRestoreOrigShell)')
endfunction

function! g:MyRestoreOrigShell()
  let &shell        = g:default_shell_options[0]
  let &shellquote   = g:default_shell_options[1]
  let &shellpipe    = g:default_shell_options[2]
  let &shellxquote  = g:default_shell_options[3]
  let &shellcmdflag = g:default_shell_options[4]
  let &shellredir   = g:default_shell_options[5]
  call common#MyEchoModeMsg(s:fname, 'Orig shell has been restored.')
endfunction

command!  MySetDefaultShell call MySetDefaultShell()
command!  MyRestoreOrigShell call MyRestoreOrigShell()
command!  MySetPowerShell call MySetPowerShell()

" vim:tw=78:ts=4:ft=vim:norl:
