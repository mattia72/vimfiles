
"-------------------------------------------------------------------------------
" Colors
"-------------------------------------------------------------------------------

"colors koehler
"colors desert
"colors ir_black
"colors oceanblack
"colors oceandeep
"colors wombat256
"colors underwater
"colors blackboard
"colors molokai
colors my_molokai
"colors badwolf
"colors impactjs-colorscheme

" Show syntax highlighting groups for word under cursor: Ctrl Shift P
"nnoremap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"if !exists("*synstack")
"return
"endif
"echo noremap(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

