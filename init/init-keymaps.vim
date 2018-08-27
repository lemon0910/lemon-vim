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

" ctags相关设置
map gd :execute 'tjump ' . expand('<cword>') <CR>
map gb <C-O>

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
nnoremap <leader>ba :%bd<CR>
nnoremap <Leader>bd :bd<CR>

" <Leader>b[1-9] move to buffer [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>' . s:i . ' :b' . s:i . '<CR>'
endfor

" Use Tab to switch buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" 去掉搜索高亮
noremap <silent><leader>sc :nohls<CR>

nnoremap <space><space> :

" 移动窗口
noremap <M-f> : call utils#Tools_PreviousCursor(1) <CR>
noremap <M-b> : call utils#Tools_PreviousCursor(0) <CR>

