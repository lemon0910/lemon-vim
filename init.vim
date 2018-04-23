"==========================================
" Initial Plugin 加载插件
"==========================================

" 标识是vim8还是neovim
let g:lemon_nvim = has('nvim') && exists('*jobwait')
let g:lemon_vim8 = exists('*job_start')

"设置支持上下左右
set nocompatible
" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 开启语法高亮
syntax on

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" NOTE: 以下配置有详细说明，一些特性不喜欢可以直接注解掉

"==========================================
" General Settings 基础设置
"==========================================

scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" Use Unix as the standard file type
set fileformats=unix,dos,mac

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" history存储容量
set history=2000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread

set wildignore=*.swp,*.o,*~,*.bak,*.pyc,*.class,.svn
set wildignore+=*.png,*.jpg,*.gif,*.zip
set wildignore+=*.obj,*.so     " Unix

" 突出显示当前列
" set cursorcolumn
" 突出显示当前行
set cursorline


" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回，在neovim下不起作用
if g:lemon_vim8
    set t_ti= t_te=
endif

" Remember info about open buffers on close
" set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap=b,s,<,>,[,]

set tags=./.tags;,.tags

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu

augroup generalSetting
    autocmd!
    " vimrc文件修改之后自动加载, windows
    " autocmd! bufwritepost _vimrc source %
    " vimrc文件修改之后自动加载, linux
    autocmd! bufwritepost .vimrc source %
    " 离开插入模式后自动关闭预览窗口
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " In the quickfix window, <CR> is used to jump to the error under the
    " cursor, so undefine the mapping there.
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    " quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
    "autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
    "autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

    " command-line window
    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

    " 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    autocmd TabLeave * let g:last_active_tab = tabpagenr()
augroup END

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set shortmess=atOI

" Puts new vsplit windows to the right of the current
set splitright
" Puts new split windows to the bottom of the current
set splitbelow
" Avoid the pop up menu occupying the whole scree
set pumheight=20

set fillchars=vert:│,stl:\ ,stlnc:\

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
let g:FoldMethod = 0
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
" nnoremap <C-n> :call NumberToggle()<cr>

"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType c,cpp setlocal tabstop=2 | set softtabstop=2 | set shiftwidth=2
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown setlocal filetype=markdown.mkd

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/sh")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

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
map gd <C-]>
map gb <C-O>

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

" normal模式下切换到确切的tab
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
" nnoremap <Leader>ww <C-W>w
nnoremap <Leader>wr <C-W>r
nnoremap <Leader>wd <C-W>c
nnoremap <Leader>wc <C-W>q
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wl <C-W>l
" nnoremap <Leader>wH <C-W>5<
" nnoremap <Leader>wL <C-W>5>
" nnoremap <Leader>wJ :resize +5<CR>
" nnoremap <Leader>wK :resize -5<CR>
" nnoremap <Leader>w= <C-W>=
nnoremap <Leader>ws <C-W>s
" nnoremap <Leader>w- <C-W>s
nnoremap <Leader>wv <C-W>v
" nnoremap <Leader>w\| <C-W>v
" nnoremap <Leader>w2 <C-W>v

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" 去掉搜索高亮
noremap <silent><leader>sc :nohls<CR>
" Toggle pastemode
nnoremap <Leader>tp :setlocal paste!<CR>

nnoremap <Enter> :
noremap <M-f> : call utils#Tools_PreviousCursor(1) <CR>
noremap <M-b> : call utils#Tools_PreviousCursor(0) <CR>

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
    set t_Co=256
    set termguicolors
    " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set t_8b=^[[48;2;%lu;%lu;%lum
    set t_8f=^[[38;2;%lu;%lu;%lum
endfunc

autocmd Colorscheme * exec ":call ColorSchemeSetting()"
colorscheme NeoSolarized
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
