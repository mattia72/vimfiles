" Vim color file
"
" Author: Mattia72
"
" Note: How it looks like, see ":h group-name"
" Based on the "monokai" theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson,
" further on "molokai" by Tomas Restrepo

hi clear

if version > 580
    " complaining
    " no guarantees for version 5.8 and below, but this makes it stop complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="mattia"


hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
hi CursorLine                    guibg=#293739
hi CursorColumn                  guibg=#293739
hi LineNr          guifg=#848483 guibg=#232526
hi CursorLineNr    guifg=#848483 guibg=#232526
hi NonText         guifg=#848483 guibg=#232526

" Note: How it looks like, see ":h group-name"
hi Comment         guifg=#588F7C			         gui=italic         "any comment

hi Constant        guifg=#AE81FF               gui=bold           "any constant
hi String          guifg=#E6DB74               gui=none           "a string constant: "this is a string"
hi Character       guifg=#E6DB74               gui=bold           "a character constant: 'c', '\n'
hi Number          guifg=#AE81FF                                  "a number constant: 234, 0xff
hi Boolean         guifg=#AE81FF                                  "a boolean constant: TRUE, false
hi Float           guifg=#AE81FF                                  "a floating point constant: 2.3e10
                                                                  "
hi Identifier      guifg=#FD971F                                  "any variable name
hi Function        guifg=#A6E22E                                  "function name (also: methods for classes)
                                                                  "
hi Statement       guifg=#F92672               gui=bold           "any statement
hi Conditional     guifg=#F92672               gui=bold           "if, then, else, endif, switch, etc.
hi Repeat          guifg=#F92672               gui=bold           "for, do, while, etc.
hi Label           guifg=#F92672               gui=italic         "case, default, etc.
hi Operator        guifg=#CC6699               gui=none           ""sizeof", "+", "*", etc.
hi Keyword         guifg=#F92672               gui=bold           "any other keyword
hi Exception       guifg=#F92672               gui=bold           "try, catch, throw
                                                                  "
hi PreProc         guifg=#A6E22E                                  "generic Preprocessor
hi Include         guifg=#A6E22E                                  "preprocessor #include
hi Define          guifg=#A6E22E                                  "preprocessor #define
hi Macro           guifg=#A6E22E               gui=italic         "same as Define
hi PreCondit       guifg=#A6E22E               gui=bold           "preprocessor #if, #else, #endif, etc.
                                                                  "
hi Type            guifg=#66D9EF               gui=none           "int, long, char, etc.
hi StorageClass    guifg=#66D9EF               gui=bold           "static, register, volatile, etc.
hi Structure       guifg=#66D9EF                                  "struct, union, enum, etc.
hi Typedef         guifg=#66D9EF                                  "A typedef
                                                                  "
hi Special         guifg=#66D9EF  guibg=bg     gui=italic         "any special symbol
hi SpecialChar     guifg=#F92672               gui=bold,italic    "special character in a constant
hi Tag             guifg=#FD971F               gui=italic         "you can use CTRL-] on this
hi Delimiter       guifg=#BCA3A3                                  "character that needs attention
hi SpecialComment  guifg=#A6E22C               gui=italic         "special things inside a comment
hi Debug           guifg=#8F8F8F               gui=bold,italic    "debugging statements
                                                                  "
hi Underlined      guifg=#808080               gui=underline      "text that stands out, HTML links
                                                                  "
hi Ignore          guifg=#808080 guibg=bg                         "left blank, hidden  |hl-Ignore|
" different background to highlight space errors!                 "
hi Error           guifg=#F92672 guibg=#1E0010                    "any erroneous construct
                                                                  "
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold           "anything that needs extra attention; mostly the
                                                                  "keywords TODO FIXME and XXX
hi SpecialKey      guifg=#888A85               gui=italic
hi Title           guifg=#ef5939
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#588F7C 
"#A6E22E
hi ErrorMsg        guifg=#F92672 guibg=#1B1D1E
hi WarningMsg      guifg=#EAF60E guibg=#1B1D1E
hi Warning         guifg=#EAF60E guibg=#1E0010
"guibg=#333333 gui=bold
"guibg=#232526
hi FoldColumn      guifg=#588F7C guibg=#000000
hi Folded          guifg=#588F7C guibg=#000000
hi IncSearch       guifg=#F6DE89 guibg=#000000

"hi clear MatchParen
hi MatchParen      guifg=#000000 guibg=#f55385  
"hi MatchParen      cterm=underline gui=underline
hi MatchParenCur   guifg=#000000 guibg=#f55385
hi MatchWordCur    cterm=underline gui=underline
hi ModeMsg         guifg=#E6DB74

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi Question        guifg=#66D9EF
hi Search          guifg=#000000 guibg=#F3D569
" #455354
" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WildMenu        guifg=#66D9EF guibg=#000000

"
" Support for 256-color terminal
"
if &t_Co > 255
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Identifier      ctermfg=208
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Function        ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=253 ctermbg=66

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=234
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Normal          ctermfg=252 ctermbg=233
   hi Comment         ctermfg=59                cterm=italic
   hi CursorLine                  ctermbg=238   cterm=none
   hi CursorColumn                ctermbg=238
   hi LineNr          ctermfg=250 ctermbg=238
   hi NonText         ctermfg=250 ctermbg=238
end
