"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set shortmess+=c
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
    " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set visualbell t_vb=
endif

function! ColorSchemeSetting()
    " 设置标记一列的背景颜色和数字一行颜色一致
    if has("termguicolors")
        set termguicolors
    endif
endfunc

autocmd Colorscheme * exec ":call ColorSchemeSetting()"
colorscheme duoduo
set background=dark " Setting dark mode

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

