
"-------------------------------------------------------------------------------
" Colors
"-------------------------------------------------------------------------------

"colors koehler
"colors desert
"colors ir_black
"colors oceanblack
"colors oceandeep
"colors underwater
"colors blackboard
"colors molokai
"colors badwolf
"colors impactjs-colorscheme

if has("gui_running")
  colors my_molokai
else
  colors wombat256i
endif

" Show syntax highlighting groups for word under cursor: Ctrl Shift P
function! <SID>SynStack()
if !exists("*synstack")
return
endif
echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <C-S-P> :call <SID>SynStack()<CR>
