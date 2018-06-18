if !exists('g:plug_group')
	"['basic', 'enhanced', 'filetypes', 'textobj', 'tags', 'airline', 'leaderf', 'fzf']
	let g:plug_group = ['basic', 'enhanced', 'filetypes']
	let g:plug_group += ['airline', 'leaderf', 'fzf']
endif

call plug#begin('~/.vim/plugged')

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:plug_group, 'basic') >= 0
    Plug 'lfv89/vim-interestingwords'           " 选中光标指向单词
    Plug 'scrooloose/nerdcommenter'             " 快速注释
    Plug 'Lokaltog/vim-easymotion'              " 更高效的移动 [,, + w/fx/h/j/k/l]
    Plug 'vim-scripts/a.vim'                    " .h和.c快速切换
    Plug 'mbbill/undotree'                      " undo
    Plug 'luochen1990/rainbow'
    Plug 'conradirwin/vim-bracketed-paste'      " 粘贴代码插件，无需再对vim设置
    Plug 'yianwillis/vimcdoc'                   " vim的中文文档
    Plug 'tpope/vim-surround'                     " 快速修改匹配
    Plug 'jiangmiao/auto-pairs'                   " 快速匹配

    " nerdcommenter {{{
    let g:NERDSpaceDelims=1

    nmap <Leader>cc <Plug>NERDCommenterToggle
    omap <Leader>cc <Plug>NERDCommenterToggle
    vmap <Leader>cc <Plug>NERDCommenterToggle
    " }}}
    " vim-interestingwords {{{
    nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
    nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
    nnoremap <silent> n :call WordNavigation('forward')<cr>
    nnoremap <silent> N :call WordNavigation('backward')<cr>
    let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
    let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
    " }}}

    " easymotion {{{
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
    " }}}
    " undotree {{{
    map <leader>u :UndotreeToggle<CR>
    " }}}

    " a.vim {{{
    " .h和.c切换相关
    map <leader>aa :A<CR>
    " }}}
    " rainbow {
    let g:rainbow_conf = {
        \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
        \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
        \	'operators': '_,_',
        \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
        \	'separately': {
        \		'*': {},
        \		'tex': {
        \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
        \		},
        \		'lisp': {
        \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
        \		},
        \		'vim': {
        \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
        \		},
        \		'html': {
        \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
        \		},
        \		'css': 0,
        \	}
        \}
" }
endif

"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:plug_group, 'enhanced') >= 0
    Plug 'mhinz/vim-startify'                   "启动窗口界面
    Plug 'scrooloose/nerdtree'
    Plug 'wsdjeg/FlyGrep.vim'
    Plug 'skywind3000/asyncrun.vim'             " 后台任务执行插件
    Plug 'tpope/vim-fugitive'                   " git相关
    Plug 'junegunn/gv.vim'
    Plug 'christoomey/vim-tmux-navigator'       " vim和tmux导航
    Plug 't9md/vim-choosewin'                   " 切换window
    Plug 'justinmk/vim-dirvish'
    Plug 'chrisbra/vim-diff-enhanced'
    Plug 'maralla/completor.vim'
    
    " vim-startify {{{
    " 默认不显示 startify
	" let g:startify_disable_at_vimenter = 1
	" let g:startify_session_dir = '~/.vim/session'
	" signify 调优
	let g:signify_vcs_list = ['git', 'svn']
	let g:signify_sign_add               = '+'
	let g:signify_sign_delete            = '_'
	let g:signify_sign_delete_first_line = '‾'
	let g:signify_sign_change            = '~'
	let g:signify_sign_changedelete      = g:signify_sign_change
	" git 仓库使用 histogram 算法进行 diff
	let g:signify_vcs_cmds = {
			\ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
			\}
    " }}}
    " fugitive {{{
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gl :Glog<CR>
    nnoremap <leader>gp :Git push<CR>
    " }}}
    " nerdtree {{{
    let g:NERDTreeShowHidden=1
    let g:NERDTreeAutoDeleteBuffer=1
    let NERDTreeHighlightCursorline=1
    let g:NERDTreeDirArrowCollapsible = '▼'
    let g:NERDTreeIgnore=[
              \ '\.py[cdo]$', '\~$', '\.swo$', '\.swp$', '\.DS_Store$',
              \ '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$',
              \ '\.obj$', '\.o$', '\.so$', '\.egg$',
              \ ]
    " close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    nnoremap <leader>n :NERDTreeToggle<CR>
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    " }}}
    " completor {
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
    " }
    " asyncrun.vim {
    nnoremap <Leader>ar :AsyncRun
    nnoremap <Leader>ao :copen<CR>
    nnoremap <Leader>ac :cclose<CR>
    " }

    " t9md/vim-choosewin {
    nmap  -  <Plug>(choosewin)
    " }

    " junegunn/gv.vim {
    nnoremap <leader>gv :GV<CR>
    " }
    " justinmk/vim-dirvish {
    nnoremap <leader>dr :Dirvish<CR>
    " }
 
    " wsdjeg/FlyGrep.vim
    " nnoremap <leader>ag :FlyGrep<CR>
    " }
endif

"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:plug_group, 'tags') >= 0

	" 提供 ctags/gtags 后台数据库自动更新功能
	Plug 'ludovicchabant/vim-gutentags'

	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
	Plug 'skywind3000/gutentags_plus'

	" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
	let g:gutentags_project_root = ['.root']
	let g:gutentags_ctags_tagfile = '.tags'

	" 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
	let g:gutentags_cache_dir = expand('~/.cache/tags')

	" 默认禁用自动生成
	let g:gutentags_modules = [] 

	" 如果有 ctags 可执行就允许动态生成 ctags 文件
	if executable('ctags')
		let g:gutentags_modules += ['ctags']
	endif

	" 如果有 gtags 可执行就允许动态生成 gtags 数据库
	if executable('gtags') && executable('gtags-cscope')
		let g:gutentags_modules += ['gtags_cscope']
	endif

	" 设置 ctags 的参数
	let g:gutentags_ctags_extra_args = []
	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

	" 使用 universal-ctags 的话需要下面这行，请反注释
	" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

	" 禁止 gutentags 自动链接 gtags 数据库
	let g:gutentags_auto_add_gtags_cscope = 0
endif

"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:plug_group, 'textobj') >= 0
	
	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'

	" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
	Plug 'kana/vim-textobj-indent'

	" 语法文本对象：iy/ay 基于语法的文本对象
	Plug 'kana/vim-textobj-syntax'

	" 函数文本对象：if/af 支持 c/c++/vim/java
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'sgur/vim-textobj-parameter'

	" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
	Plug 'bps/vim-textobj-python', {'for': 'python'}

	" 提供 uri/url 的文本对象，iu/au 表示
	Plug 'jceb/vim-textobj-uri'
endif
 
"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:plug_group, 'filetypes') >= 0

	" powershell 脚本文件的语法高亮
	Plug 'pprovost/vim-ps1', { 'for': 'ps1' }

	" lua 语法高亮增强
	Plug 'tbastos/vim-lua', { 'for': 'lua' }

	" C++ 语法高亮增强，支持 11/14/17 标准
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

	" 额外语法文件
	Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

	" python 语法文件增强
	Plug 'vim-python/python-syntax', { 'for': ['python'] }

	" rust 语法增强
	Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    Plug 'fatih/vim-go', {'for': 'go'}
    Plug 'tmhedberg/SimpylFold', { 'for': 'python' }

    " vim-go {{{
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    let g:go_fmt_fail_silently = 1
    " }}}
endif

"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:plug_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'              " 状态栏增强展示
    Plug 'vim-airline/vim-airline-themes'
    
    " vim-airline {
    let g:airline_theme='violet'
    let g:airline_solarized_bg='dark'
    let g:Powerline_symbols='fancy'
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s:'
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#fnamecollapse = 1
    let g:airline#extensions#tabline#fnametruncate = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#default#section_truncate_width = {
                \ 'b': 79,
                \ 'x': 60,
                \ 'y': 88,
                \ 'z': 45,
                \ 'warning': 80,
                \ 'error': 80,
                \ }
    let g:airline#extensions#default#layout = [
                \ [ 'a', 'error', 'warning', 'b', 'c' ],
                \ [ 'x', 'y', 'z' ]
                \ ]
    " 关闭状态显示空白符号计数
    let g:airline#extensions#whitespace#enabled = 0
    let g:airline#extensions#whitespace#symbol = '!'
    " Distinct background color is enough to discriminate the warning and
    " error information.
    let g:airline#extensions#ale#error_symbol = '•'
    let g:airline#extensions#ale#warning_symbol = '•'
    " }
endif

"----------------------------------------------------------------------
" fzf
"----------------------------------------------------------------------
if index(g:plug_group, 'fzf') >= 0
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'pbogut/fzf-mru.vim'
    " fzf {
    nnoremap <Leader>ff :Files<CR>
    " nnoremap <Leader>fg :GFiles<CR>
    " nnoremap <Leader>fb :Buffers<CR>
    nnoremap <Leader>ag :Ag
    " nnoremap <Leader>ss :BLines<CR>
    " nnoremap <Leader>ft :BTags<CR>
    " nnoremap <Leader>fa :Tags<CR>
    " nnoremap <Leader>fr :FZFMru<CR>

    " This is the default extra key bindings
    let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

    " Default fzf layout
    " - down / up / left / right
    let g:fzf_layout = { 'down': '~40%' }

    " " In Neovim, you can set up fzf window using a Vim command
    let g:fzf_layout = { 'window': 'enew' }
    let g:fzf_layout = { 'window': '-tabnew' }
    let g:fzf_layout = { 'window': '10split enew' }

    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
    " }
endif

"----------------------------------------------------------------------
" LeaderF
"----------------------------------------------------------------------
if index(g:plug_group, 'leaderf') >= 0
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    " Yggdroot/LeaderF {
    nnoremap <leader>ss :LeaderfLine<CR>
    nnoremap <leader>ft :LeaderfFunction<CR>
    nnoremap <leader>fa :LeaderfTag<CR>
    nnoremap <leader>se :LeaderfSelf<CR>
    nnoremap <leader>fr :LeaderfMru<CR>

    let g:Lf_ShortcutF = '<leader>fg'
    let g:Lf_ShortcutB = '<leader>fb'
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_CursorBlink = 0
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    " let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o', '*.lo', '*.so','*.py[co]']
            \}
    let g:Lf_MruFileExclude = ['*.sw?','~$*','*.bak','*.exe','*.o', '*.lo', '*.so','*.py[co]']
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.vim/cache')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_DefaultExternalTool = 'ag'
    let g:Lf_UseVersionControlTool = 0
    let g:Lf_WorkingDirectoryMode = 'Ac'
    " }
endif

" Add plugins to &runtimepath
call plug#end()
 
"------------------------------------------- end of configs --------------------------------------------
