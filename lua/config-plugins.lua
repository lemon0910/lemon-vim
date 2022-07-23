-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

-- plugin config
-- vim-interestingwords {{{
vim.g.interestingWordsGUIColors = {'#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'}
vim.g.nterestingWordsTermColors = {'154', '121', '211', '137', '214', '222'}
-- }}}

-- nerdcommenter {{{
-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1
-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1

-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1
-- }}}

-- undotree {{{
map("n", "<leader>u", ":UndotreeToggle<CR>", opt)
-- }}}

-- a.vim {{{
-- .h和.c切换相关
map("n", "<leader>aa", ":A<CR>", opt)
-- }}}

-- vim-startify {{{
-- signify 调优
vim.g.signify_vcs_list = {'git', 'svn'}
vim.g.signify_sign_add               = '+'
vim.g.signify_sign_delete            = '_'
vim.g.signify_sign_delete_first_line = '‾'
vim.g.signify_sign_change            = '~'
vim.g.signify_sign_changedelete      = vim.g.signify_sign_change
-- git 仓库使用 histogram 算法进行 diff
vim.g.signify_vcs_cmds = {git = 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f'}
-- }}}

-- fugitive {{{
map("n", "<leader>gb", ":Git blame<CR>", opt)
-- }}}


-- kyazdani42/nvim-tree.lua
-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)
--}

-- t9md/vim-choosewin {
map("n", "-", ":ChooseWin<CR>", opt)
-- }

-- vim-ags {
map("n", "<leader>ag", ":Ags", opt)
vim.g.ags_enable_async = 1
-- }

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
    -- 左侧让出 nvim-tree 的位置
    offsets = {{
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left"
    }},
  }
}

-- telescope
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opt)

-- hop.vim
require("hop").setup()
map("n", "s", ":HopChar2<CR>", opt)

-- galaxyline
require("galaxyline.themes.spaceline")

-- complete
local cmp = require'cmp'
cmp.setup({
    mapping = {
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'buffer' },
    })
  })

vim.o.completeopt="menu,menuone,noselect"

-- tags
-- 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
vim.g.gutentags_project_root = {'.root'}
vim.g.gutentags_ctags_tagfile = 'tags'

-- 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')

-- 默认禁用自动生成
vim.g.gutentags_modules = {'ctags', 'gtags_cscope'}

-- 设置 ctags 的参数
vim.g.gutentags_ctags_extra_args = {'--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px', '--output-format=e-ctags'}

-- 禁止 gutentags 自动链接 gtags 数据库
vim.g.gutentags_auto_add_gtags_cscope = 0
vim.g.gutentags_plus_switch = 1
-- let g:gutentags_define_advanced_commands = 1
vim.g.gutentags_plus_nomap = 1
map("n", "<leader>gs", ":GscopeFind s <C-R><C-W><cr>", opt)

-- autopair
require('nvim-autopairs').setup{}

-- fzf
map("n", "<Leader>ff", ":Files<CR>", opt)
map("n", "<Leader>fg", ":GFiles<CR>", opt)
map("n", "<Leader>fb", ":Buffers<CR>", opt)
map("n", "<Leader>ft", ":BTags<CR>", opt)
map("n", "<Leader>fa", ":Tags<CR>", opt)
map("n", "<Leader>fr", ":FZFMru<CR>", opt)

require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"c", "cpp"},
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}
