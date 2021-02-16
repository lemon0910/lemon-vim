if !exists('g:bundle_group')
	"['themes', 'basic', 'enhanced', 'filetypes', 'textobj', 'tags', 'airline', 'fzf', 'ycmd', 'complete']
	let g:bundle_group = ['themes', 'basic', 'enhanced', 'filetypes']
	let g:bundle_group += ['fzf', 'airline', 'tags']
endif

call plug#begin('~/.vim/bundle')

"----------------------------------------------------------------------
" 主题安装
"----------------------------------------------------------------------
if index(g:bundle_group, 'themes') >= 0
    Plug 'KeitaNakamura/neodark.vim'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'overcache/NeoSolarized'
    Plug 'srcery-colors/srcery-vim'

    let g:srcery_inverse_matches = 1
endif

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'basic') >= 0
    Plug 'lfv89/vim-interestingwords'           " 选中光标指向单词
    Plug 'preservim/nerdcommenter'              " 快速注释
    Plug 'easymotion/vim-easymotion'              " 更高效的移动 [,, + w/fx/h/j/k/l]
    Plug 'mbbill/undotree'                      " undo
    Plug 'yianwillis/vimcdoc'                   " vim的中文文档
    Plug 'tpope/vim-surround'                     " 快速修改匹配
    Plug 'jiangmiao/auto-pairs'                   " 快速匹配

    " nerdcommenter {{{
    " " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' , 'cpp' : { 'left' : '/**', 'right' : '*/' }} }

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " }}}

    " vim-interestingwords {{{
    let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
    let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
    " }}}

    " easymotion {{{
    let g:EasyMotion_smartcase = 1
    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-s2)
    " }}}

    " undotree {{{
    map <leader>u :UndotreeToggle<CR>
    " }}}

    " a.vim {{{
    " .h和.c切换相关
    map <leader>aa :A<CR>
    " }}}
endif

"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
if index(g:bundle_group, 'enhanced') >= 0
    Plug 'mhinz/vim-startify'                   "启动窗口界面
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'                   " git相关
    Plug 'junegunn/gv.vim'
    Plug 'christoomey/vim-tmux-navigator'       " vim和tmux导航
    Plug 't9md/vim-choosewin'                   " 切换window
    Plug 'chrisbra/vim-diff-enhanced'
    Plug 'tpope/vim-unimpaired'
    Plug 'gabesoft/vim-ags'
    Plug 'skywind3000/vim-terminal-help'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/asyncrun.extra'

    if index(g:bundle_group, 'complete') < 0
        Plug 'skywind3000/vim-auto-popmenu'
        " 配置
        " enable this plugin for filetypes, '*' for all files.
        " let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, 'cc':1}
        let g:apc_enable_ft = {'*':1}
        " source for dictionary, current or other loaded buffers, see ':help cpt'
        set cpt=.,w,b
        " don't select the first item.
        set completeopt=menu,menuone,noselect
        " suppress annoy messages.
        set shortmess+=c
    endif

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
    " }}}

    " junegunn/gv.vim {
    nnoremap <leader>gv :GV<CR>
    " }

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
    " t9md/vim-choosewin {
    nmap - <Plug>(choosewin)
    " }

    " vim-ags {
     nnoremap <leader>ag :Ags <Space>
     let g:ags_enable_async = 1
     let g:ags_agargs = {
                \ '--break'             : [ '', '' ],
                \ '--color'             : [ '', '' ],
                \ '--color-line-number' : [ '"1;30"', '' ],
                \ '--color-match'       : [ '"32;40"', '' ],
                \ '--color-path'        : [ '"1;31"', '' ],
                \ '--column'            : [ '', '' ],
                \ '--context'           : [ 'g:ags_agcontext', '-C' ],
                \ '--filename'          : [ '', '' ],
                \ '--group'             : [ '', '' ],
                \ '--heading'           : [ '', '-H' ],
                \ '--max-count'         : [ 'g:ags_agmaxcount', '-m' ],
                \ '--numbers'           : [ '', '' ]
                \ }
    " }
    
    " skywind3000/vim-terminal-help {
    let g:terminal_height = 25
    " }

    " skywind3000/asyncrun.vim {
    nnoremap <leader>ar :AsyncRun -mode=term -pos=thelp
    " }
endif

"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------
if index(g:bundle_group, 'tags') >= 0

	" 提供 ctags/gtags 后台数据库自动更新功能
	Plug 'ludovicchabant/vim-gutentags'

	" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
	" 支持光标移动到符号名上：<leader>cg 查看定义，<leader>cs 查看引用
	Plug 'skywind3000/gutentags_plus'

	" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
	let g:gutentags_project_root = ['.root']
	let g:gutentags_ctags_tagfile = 'tags'

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
    let g:gutentags_plus_switch = 1
    " let g:gutentags_define_advanced_commands = 1
    let g:gutentags_plus_nomap = 1

    noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
endif

"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------
if index(g:bundle_group, 'textobj') >= 0

	" 基础插件：提供让用户方便的自定义文本对象的接口
	Plug 'kana/vim-textobj-user'

	" 函数文本对象：if/af 支持 c/c++/vim/java
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

	" 参数文本对象：i,/a, 包括参数或者列表元素
	Plug 'sgur/vim-textobj-parameter'

	" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
	Plug 'bps/vim-textobj-python', {'for': 'python'}
endif

"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------
if index(g:bundle_group, 'filetypes') >= 0
    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

	" 额外语法文件
	Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }

	" python 语法文件增强
	Plug 'vim-python/python-syntax', { 'for': ['python'] }

    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_posix_standard = 1
    let g:cpp_experimental_template_highlight = 1
endif

"----------------------------------------------------------------------
" airline
"----------------------------------------------------------------------
if index(g:bundle_group, 'airline') >= 0
    Plug 'vim-airline/vim-airline'              " 状态栏增强展示
    Plug 'vim-airline/vim-airline-themes'

    " vim-airline {
    " let g:airline_theme='hybrid'
    let g:Powerline_symbols='fancy'
    " let g:airline_powerline_fonts = 1
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
if index(g:bundle_group, 'fzf') >= 0
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'pbogut/fzf-mru.vim'
    " fzf {
    nnoremap <Leader>ff :Files<CR>
    nnoremap <Leader>fg :GFiles<CR>
    nnoremap <Leader>fb :Buffers<CR>
    nnoremap <Leader>ft :BTags<CR>
    nnoremap <Leader>fa :Tags<CR>
    nnoremap <Leader>fr :FZFMru<CR>
    nnoremap <Leader>ss :BLines<CR>
endif

"----------------------------------------------------------------------
" YouCompleteMe 默认设置：YCM 需要你另外手动编译安装
"----------------------------------------------------------------------

if (index(g:bundle_group, 'ycmd')) >= 0
    Plug 'Valloric/YouCompleteMe'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

    let g:ycm_global_ycm_extra_conf = '~/.vim/tools/conf/.ycm_extra_conf.py'
    " 禁用预览功能：扰乱视听
    let g:ycm_add_preview_to_completeopt = 0
" 
    " " 禁用诊断功能：我们用前面更好用的 ALE 代替
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    set completeopt=menu,menuone

    " " 两个字符自动触发语义补全
    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }

    nnoremap <Leader>yg :YcmGenerateConfig<CR>

    "----------------------------------------------------------------------
    " Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
    "----------------------------------------------------------------------
    let g:ycm_filetype_whitelist = {
                \ "c":1,
                \ "cpp":1,
                \ "objc":1,
                \ "objcpp":1,
                \ "python":1,
                \ "java":1,
                \ "javascript":1,
                \ "coffee":1,
                \ "vim":1,
                \ "go":1,
                \ "cs":1,
                \ "lua":1,
                \ "perl":1,
                \ "perl6":1,
                \ "php":1,
                \ "ruby":1,
                \ "rust":1,
                \ "erlang":1,
                \ "asm":1,
                \ "nasm":1,
                \ "masm":1,
                \ "tasm":1,
                \ "asm68k":1,
                \ "asmh8300":1,
                \ "asciidoc":1,
                \ "basic":1,
                \ "vb":1,
                \ "make":1,
                \ "cmake":1,
                \ "html":1,
                \ "css":1,
                \ "less":1,
                \ "json":1,
                \ "cson":1,
                \ "typedscript":1,
                \ "haskell":1,
                \ "lhaskell":1,
                \ "lisp":1,
                \ "scheme":1,
                \ "sdl":1,
                \ "sh":1,
                \ "zsh":1,
                \ "bash":1,
                \ "man":1,
                \ "markdown":1,
                \ "matlab":1,
                \ "maxima":1,
                \ "dosini":1,
                \ "conf":1,
                \ "config":1,
                \ "zimbu":1,
                \ "ps1":1,
                \ }
endif

" Add plugins to &runtimepath
call plug#end()

"------------------------------------------- end of configs --------------------------------------------
