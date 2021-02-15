"==========================================
" lemon's vim
"==========================================
" 标识是vim8还是neovim
let g:lemon_nvim = has('nvim') && exists('*jobwait')
let g:lemon_vim8 = exists('*job_start')

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

let g:mapleader = ','
let g:maplocalleader = ' '

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so ~/.vim/<args>'
set rtp+=~/.vim

" 加载基础配置
LoadScript init/init-basic.vim
" 自定义按键
LoadScript init/init-keymaps.vim
" 插件加载
LoadScript init/init-plugins.vim
" 界面样式
LoadScript init/init-themes.vim
