
" --------------------------------------------
" lightline
" --------------------------------------------
function! MySetLightLine()
  setlocal encoding=utf8
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set noshowmode
  nnoremap <leader>ll :LightlineReload<cr>

  let g:lightline = {
        \'colorscheme': 'powerline',
		    \'component_function': {
		    \   'readonly': 'LightlineReadonly',
		    \   'fugitive': 'LightlineFugitive',
		    \ },                        
        \'separator' : { 'left': '', 'right': '' },
				\'subseparator' : { 'left': '', 'right': '' },
				\'component': { 'lineinfo': ' %3l:%-2v', }
	      \}

        "\'separator' : { 'left': '', 'right': '' },
				"\'subseparator' : { 'left': '', 'right': '' },
				"
	"Ubuntu for powerline
        "'separator' : { 'left': '⮀', 'right': '⮂' },
				"'subseparator' : { 'left': '⮁', 'right': '⮃' },
				"'component': { 'lineinfo': '⭡ %3l:%-2v', },

  let g:lightline#asyncrun#indicator_run = 'running...'
  let g:lightline#asyncrun#indicator_none = ''

  let g:lightline.component_expand = {
        \ 'asyncrun_status': 'lightline#asyncrun#status',
        \ 'current_directory': 'getcwd',
        \ }

  let g:lightline.active = {
		    \ 'left': [ 
	      \   [ 'mode', 'paste' ],
		    \   [ 'readonly','current_directory','relativepath', 'modified' ],
        \  ],
        \ 'right': [
        \	  ['percent', 'lineinfo'],
        \	  ['fileformat', 'fileencoding', 'filetype'],
        \   ['asyncrun_status'],
        \ ]}
endfunction

function! LightlineReadonly()
	"return &readonly ? '⭤' : ''
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ''.branch : ''
		"return branch !=# '' ? '⭠ '.branch : ''
	endif
	return ''
endfunction

command! LightlineReload call <SID>LightlineReload()

function! <SID>LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

call MySetLightLine()

