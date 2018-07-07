"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 代码折叠自定义快捷键 <leader>zz
map <leader>zz :call ToggleFold()<cr>

" ctags相关设置
map gd :execute 'tjump ' . expand('<cword>') <CR>
map gb <C-O>

" 行号开关
nnoremap <C-n> :call utils#ToggleNumber()<CR>

" 命令行模式增强，ctrl - a到行首， -e 到行尾
noremap <C-a> <Home>
noremap <C-e> <End>

" Quit visual mode
" vnoremap v <Esc>
" Move to the start of line
nnoremap H ^
" Move to the end of line
nnoremap L $

" 退出相关
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>Q :q!<CR>

" normal模式下切换到确切的buffer
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>bc :%bd<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bk :bw<CR>

" <Leader>b[1-9] move to buffer [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>' . s:i . ' :b' . s:i . '<CR>'
endfor

" Use Tab to switch buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" 窗口相关
nnoremap <Leader>wr <C-W>r
nnoremap <Leader>wd <C-W>c
nnoremap <Leader>wc <C-W>q
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wl <C-W>l
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v
" 复制选中区到系统剪切板中
vnoremap <leader>yy "+y

" 去掉搜索高亮
noremap <silent><leader>sc :nohls<CR>
" Toggle pastemode
nnoremap <Leader>tp :setlocal paste!<CR>

nnoremap ` :

" 移动窗口
noremap <M-f> : call utils#Tools_PreviousCursor(1) <CR>
noremap <M-b> : call utils#Tools_PreviousCursor(0) <CR>

