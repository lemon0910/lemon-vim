-- basic
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- utf8
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'utf-8'

-- 文件修改之后自动载入
vim.o.autoread = true

vim.o.suffixes = '.bak,~,.o,.lo,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class'

vim.o.wildignore = '*.o,*.lo,*.obj,*~,*.exe,*.a,*.pdb,*.lib,*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex,*.svn,*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz,*DS_Store*,*.ipch,*.gem,*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**,*/.nx/**,*.app,*.git,.git,*.wav,*.mp3,*.ogg,*.pcm,*.mht,*.suo,*.sdf,*.jnlp,*.chm,*.epub,*.pdf,*.mobi,*.ttf*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc,*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps,*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu,*.gba,*.sfc,*.078,*.nds,*.smd,*.smc,*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android'

-- 突出显示当前行
vim.o.cursorline = true

-- For regular expressions turn magic on
vim.o.magic = true

-- Configure backspace so it acts as it should act
vim.o.backspace = 'eol,start,indent'
vim.o.whichwrap= 'b,s,<,>,[,]'

vim.o.tags= './tags;,tags'

-- 增强模式中的命令行自动完成操作
vim.o.wildmenu = true

-- 延迟绘制（提升性能）
vim.o.lazyredraw = true

-- Puts new vsplit windows to the right of the current
vim.o.splitright = true
-- Puts new split windows to the bottom of the current
vim.o.splitbelow = true
--Avoid the pop up menu occupying the whole scree
vim.o.pumheight = 20

-- 显示当前的行号列号
vim.o.ruler = true
-- 在状态栏显示正在输入的命令
vim.o.showcmd = true

-- 在上下移动光标时，光标的上方或下方至少会保留显示的行数
vim.o.scrolloff = 7

-- 括号配对情况, 跳转并高亮一下匹配的括号
vim.o.showmatch = true
-- How many tenths of a second to blink when matching brackets
vim.o.matchtime = 2

-- 设置文内智能搜索提示
-- 高亮search命中的文本
vim.o.hlsearch = true
-- 打开增量搜索模式,随着键入即时搜索
vim.o.incsearch = true
-- 搜索时忽略大小写
vim.o.ignorecase = true
-- 有一个或以上大写字母时仍大小写敏感
vim.o.smartcase = true

-- Smart indent
vim.o.smartindent = true
-- 打开自动缩进
-- never add copyindent, case error   " copy the previous indentation on autoindenting
vim.o.autoindent = true

-- tab相关变更
-- 设置Tab键的宽度        [等同的空格个数]
vim.o.tabstop = 2
-- 每一次缩进对应的空格数
vim.o.shiftwidth = 4
-- 按退格键时可以一次删掉 4 个空格
vim.o.softtabstop = 4
-- insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
vim.o.smarttab = true
-- 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
vim.o.expandtab = true
-- 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
vim.o.shiftround = true

-- A buffer becomes hidden when it is abandoned
vim.o.wildmode = 'list:longest'
vim.o.ttyfast = true

vim.cmd('augroup generalSetting')
vim.cmd('autocmd!')
-- 离开插入模式后自动关闭预览窗口
vim.cmd('autocmd InsertLeave * if pumvisible() == 0|pclose|endif')
-- command-line window
vim.cmd('autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>')
-- 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
vim.cmd([[
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        ]])
vim.cmd('autocmd TabLeave * let g:last_active_tab = tabpagenr()')
vim.cmd('augroup END')
