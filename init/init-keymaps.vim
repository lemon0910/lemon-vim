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

inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

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

" normal模式下切换到确切的buffer
nnoremap <leader>ba :%bd<CR>
nnoremap <Leader>bd :bd<CR>

" <Leader>b[1-9] move to buffer [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>' . s:i . ' :b' . s:i . '<CR>'
endfor

nnoremap <Tab> :call BufferNextSkipEnew()<CR>
nnoremap <S-Tab> :call BufferPreSkipEnew()<CR>

" 去掉搜索高亮
noremap <silent><leader>sc :nohls<CR>

nnoremap ; :

" vim终端的映射
if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
	" vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
	" 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
	" 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
	set termwinkey=<c-_>
	tnoremap <C-h> <c-_>h
	tnoremap <C-l> <c-_>l
	tnoremap <c-j> <c-_>j
	tnoremap <C-k> <c-_>k
	tnoremap <C-q> <c-\><c-n>
elseif has('nvim')
	" neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
	tnoremap <C-h> <c-\><c-n><c-w>h
	tnoremap <C-l> <c-\><c-n><c-w>l
	tnoremap <C-j> <c-\><c-n><c-w>j
	tnoremap <C-k> <c-\><c-n><c-w>k
	tnoremap <C-q> <c-\><c-n>
endif
