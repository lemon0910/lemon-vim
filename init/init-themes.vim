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
    set linespace=2
    set noimd
    set t_Co=256
    " No annoying sound on errors
  set noerrorbells
  set novisualbell
  set visualbell t_vb=
  set noshowmode
endif

if has("termguicolors")
    set termguicolors
endif

colorscheme neodark
set background=dark

