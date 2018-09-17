"==========================================
" 初始化设置
"==========================================
"设置支持上下左右
set nocompatible

"==========================================
" General Settings 基础设置
"==========================================
" 开启语法高亮
syntax on

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

" 文件修改之后自动载入
set autoread

set suffixes=.bak,~,.o,.lo,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.lo,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex,*.svn
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

" 突出显示当前行
set cursorline

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap=b,s,<,>,[,]

set tags=./tags;,tags

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu

" 延迟绘制（提升性能）
set lazyredraw


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

" 设置代码折叠
if has('folding')
" 允许代码折叠
    set foldenable
    " 代码折叠默认使用缩进
    set fdm=indent
    " 默认打开所有缩进
    set foldlevel=99
endif

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

augroup generalSetting
    autocmd!
    " vimrc文件修改之后自动加载, windows
    " autocmd! bufwritepost _vimrc source %
    " vimrc文件修改之后自动加载, linux
    autocmd! bufwritepost .vimrc source %
    " 离开插入模式后自动关闭预览窗口
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    " command-line window
    autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

    " 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    autocmd TabLeave * let g:last_active_tab = tabpagenr()
augroup END
