"==========================================
" Theme Settings  主题设置
"==========================================
if has("termguicolors")
    set termguicolors
    " 修复在tmux色彩显示的问题
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
colorscheme hybrid_reverse
set noshowmode
