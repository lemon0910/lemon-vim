" Vim color file - duoduo
" Maintainer:	Yggdroot <archofortune@gmail.com>

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

highlight StatusLine guifg=#d3d7cf guibg=#326B6B
highlight TabLine guifg=#326B6B guibg=#D5F0D5
highlight TabLineSel guifg=#118811 guibg=#c7edcc
highlight TabLineFill guibg=#c7edcc

highlight Normal guifg=#326B6B guibg=#c7edcc gui=NONE

highlight SignColumn guisp=#363636 guifg=NONE guibg=#363636 gui=NONE
highlight SpecialComment guifg=#ffa500 guibg=NONE gui=NONE
highlight Typedef guifg=#deb887 guibg=NONE
highlight Folded guisp=#383838 guifg=#999999 guibg=#383838 gui=NONE
highlight PreCondit guisp=NONE guifg=#8d4bbb guibg=NONE
highlight Include guisp=NONE guifg=#326B6B guibg=NONE
highlight Float guisp=NONE guifg=#ff477e guibg=NONE gui=bold
highlight DiffText guisp=#fa2d2d guifg=NONE guibg=#fa2d2d gui=NONE
highlight ErrorMsg guisp=#fa2d2d guifg=#ffffff guibg=#fa2d2d gui=NONE
highlight Debug guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE
highlight Identifier guisp=NONE guifg=#177cb0 guibg=NONE gui=NONE
highlight SpecialChar guisp=NONE guifg=#ffa500 guibg=NONE gui=NONE
highlight Conditional guisp=NONE guifg=#801dae guibg=NONE gui=bold
highlight StorageClass guisp=NONE guifg=#801dae guibg=NONE gui=bold
highlight Todo guisp=#ffff17 guifg=#0000ff guibg=#ffff17 gui=NONE
highlight Label guisp=NONE guifg=#f5f55d guibg=NONE gui=NONE
highlight Search guisp=#ffff45 guifg=#000000 guibg=#ffff45 gui=NONE
highlight Statement guisp=NONE guifg=#801dae guibg=NONE gui=bold
highlight Comment guisp=NONE guifg=#a88462 guibg=NONE gui=NONE
highlight Character guisp=NONE guifg=#ffa0a0 guibg=NONE gui=NONE
highlight Number guisp=NONE guifg=#ff477e guibg=NONE gui=bold
highlight Boolean guisp=NONE guifg=#ffa0a0 guibg=NONE gui=NONE
highlight CursorLine guisp=#454545 guifg=NONE guibg=#A0F0A0 gui=NONE
highlight Define guisp=NONE guifg=#8d4bbb guibg=NONE gui=NONE
highlight Function guisp=NONE guifg=#b25d25 guibg=NONE gui=NONE
highlight PreProc guisp=NONE guifg=#8d4bbb guibg=NONE gui=bold
highlight Exception guisp=NONE guifg=#801dae guibg=NONE gui=bold
highlight Keyword guisp=NONE guifg=#deb887 guibg=NONE gui=bold
highlight Type guisp=NONE guifg=#326B6B guibg=NONE gui=bold
highlight Constant guisp=NONE guifg=#2e8b57 guibg=NONE gui=NONE
highlight Repeat guisp=NONE guifg=#801dae guibg=NONE gui=bold
highlight Structure guisp=NONE guifg=#801dae guibg=NONE gui=bold
highlight Macro guisp=NONE guifg=#deb887 guibg=NONE gui=NONE
highlight CursorLineNr guisp=NONE guifg=#666666 guibg=NONE gui=NONE

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
