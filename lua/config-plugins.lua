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
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
      find_files = {
          -- theme = "dropdown",
      }
  }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})

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

require'cmp'.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

-- autopair
require('nvim-autopairs').setup{}

-- fzf
-- map("n", "<Leader>ff", ":Files<CR>", opt)
-- map("n", "<Leader>fg", ":GFiles<CR>", opt)
-- map("n", "<Leader>fb", ":Buffers<CR>", opt)
-- map("n", "<Leader>ft", ":BTags<CR>", opt)
-- map("n", "<Leader>fa", ":Tags<CR>", opt)
-- map("n", "<Leader>fr", ":FZFMru<CR>", opt)

require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"c", "cpp"},
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {"lua"},
  }
}

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})

-- gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- alpha
require'alpha'.setup(require'alpha.themes.dashboard'.config)
-- toggleterm
require('toggleterm').setup {
  -- size can be a number or function which is passed the current terminal
  function(term)
    if term.direction == "horizontal" then
      return 40
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

map('n', '<c-`>', ':ToggleTerm size=40 direction=horizontal<CR>', opt)
