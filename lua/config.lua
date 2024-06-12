-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

-- plugin config
-- vim-interestingwords {{{
require("interestingwords").setup {
  -- colors = { '#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b' },
  search_count = true,
  navigation = true,
  search_key = "<leader>m",
  cancel_search_key = "<leader>M",
  color_key = "<leader>k",
  cancel_color_key = "<leader>K",
}
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
-- map("n", "<leader>u", ":UndotreeToggle<CR>", opt)
-- }}}

-- a.vim {{{
-- .h和.c切换相关
map("n", "<leader>aa", ":A<CR>", opt)
-- }}}

-- fugitive {{{
map("n", "<leader>gb", ":Git blame<CR>", opt)
-- }}}

-- t9md/vim-choosewin {
map("n", "<leader>o", ":ChooseWin<CR>", opt)
-- }

-- vim-ripgrep {
    vim.g.rg_highlight = true
    map("n", "<leader>rg", ":Rg", opt)
-- }

-- kyazdani42/nvim-tree.lua
-- empty setup using defaults
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    -- mappings = {
      -- list = {
        -- { key = "u", action = "dir_up" },
      -- },
    -- },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)
})
--}

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

-- flash.vim
require("flash").setup()
vim.keymap.set('n', 's', function() require("flash").jump() end, {})

-- lualine
require('lualine').setup({
    sections = {
       lualine_c = {
           {
              'filename',
              file_status = true,      -- Displays file status (readonly status, modified status)
              newfile_status = false,  -- Display new file status (new file means no write after created)
              path = 3,                -- 0: Just the filename
              -- 1: Relative path
              -- 2: Absolute path
              -- 3: Absolute path, with tilde as the home directory
              -- 4: Filename and parent dir, with tilde as the home directory

              shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
              -- for other components. (terrible name, any suggestions?)
              symbols = {
                      modified = '[+]',      -- Text to show when the file is modified.
                      readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                      unnamed = '[No Name]', -- Text to show for unnamed buffers.
                      newfile = '[New]',     -- Text to show for newly created file before first write
              }
           }
       }
    }
})

-- complete
local cmp = require'cmp'
-- local lspkind = require('lspkind')

cmp.setup({
  completion = {
      completeopt = 'menu,menuone,noselect',
  },
  -- formatting = {
    -- format = lspkind.cmp_format({
      -- with_text = true, -- do not show text alongside icons
      -- maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    -- })
  -- },
    window = {
    completion = {
      side_padding = 1,
      -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
      scrollbar = false,
      border = "rounded"
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:CmpDoc",
    },
  },
    mapping = {
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    }),
  })
-- vim.o.completeopt="menu,menuone,noselect"

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})

-- autopair
require('nvim-autopairs').setup{}

require'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"c", "cpp"},
  ignore_install = { "vim" },
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {"lua"},
  }
}

-- telescope
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    -- prompt_prefix = "   ",
    -- selection_caret = "  ",
    -- entry_prefix = "  ",
    -- initial_mode = "insert",
    -- selection_strategy = "reset",
    -- sorting_strategy = "ascending",
    -- layout_strategy = "horizontal",
    -- layout_config = {
      -- horizontal = {
        -- prompt_position = "top",
        -- preview_width = 0.55,
        -- results_width = 0.8,
      -- },
      -- vertical = {
        -- mirror = false,
      -- },
      -- width = 0.87,
      -- height = 0.80,
      -- preview_cutoff = 120,
    -- },
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
  },
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {}),
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}),
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {}),
  vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {}),
  vim.keymap.set('n', '<leader>ft', builtin.treesitter, {}),
  vim.keymap.set('n', '<leader>fm', builtin.marks, {}),
  vim.keymap.set('n', '<leader>fq', builtin.quickfix, {}),
  vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {}),
  vim.keymap.set('n', '<leader>fc', builtin.commands, {}),
  vim.keymap.set('n', '<leader>fq', builtin.quickfix, {}),
  vim.keymap.set('n', '<leader>fo', builtin.resume, {}),
  vim.keymap.set('n', 'gs', builtin.grep_string, {}),
  vim.keymap.set('n', 'gr', builtin.lsp_references, {})
}


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
    delay = 500,
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
require'alpha'.setup(require'alpha.themes.startify'.config)
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
  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()'),

  map('n', '<leader>`', ':ToggleTerm size=40 direction=horizontal<CR>', opt)
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

-- local navic = require("nvim-navic")
-- navic.setup {
    -- icons = {
        -- File          = "󰈙 ",
        -- Module        = " ",
        -- Namespace     = "󰌗 ",
        -- Package       = " ",
        -- Class         = "󰌗 ",
        -- Method        = "󰆧 ",
        -- Property      = " ",
        -- Field         = " ",
        -- Constructor   = " ",
        -- Enum          = "󰕘",
        -- Interface     = "󰕘",
        -- Function      = "󰊕 ",
        -- Variable      = "󰆧 ",
        -- Constant      = "󰏿 ",
        -- String        = "󰀬 ",
        -- Number        = "󰎠 ",
        -- Boolean       = "◩ ",
        -- Array         = "󰅪 ",
        -- Object        = "󰅩 ",
        -- Key           = "󰌋 ",
        -- Null          = "󰟢 ",
        -- EnumMember    = " ",
        -- Struct        = "󰌗 ",
        -- Event         = " ",
        -- Operator      = "󰆕 ",
        -- TypeParameter = "󰊄 ",
    -- },
    -- lsp = {
        -- auto_attach = false,
        -- preference = nil,
    -- },
    -- highlight = false,
    -- separator = " > ",
    -- depth_limit = 0,
    -- depth_limit_indicator = "..",
    -- safe_output = true,
    -- click = false
-- }
-- 

-- require'lspconfig'.clangd.setup{}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- laygit config
map("n", "<leader>gl", ":LazyGit<CR>", opt)

-- require("lspsaga").setup({
    -- finder = {
        -- max_height = 0.5,
        -- min_width = 30,
        -- force_max_height = false,
        -- keys = {
        -- expand_or_jump = 'o',
        -- vsplit = 's',
        -- split = 'i',
        -- tabe = 't',
        -- tabnew = 'r',
        -- quit = { 'q', '<ESC>' },
        -- close_in_preview = '<ESC>',
        -- },
    -- },
    -- code_action = {
        -- num_shortcut = true,
        -- show_server_name = false,
        -- extend_gitsigns = true,
        -- keys = {
        -- -- string | table type
        -- quit = "q",
        -- exec = "<CR>",
        -- },
    -- },
    -- outline = {
        -- win_position = "right",
        -- win_with = "",
        -- win_width = 30,
        -- preview_width= 0.4,
        -- show_detail = true,
        -- auto_preview = true,
        -- auto_refresh = true,
        -- auto_close = true,
        -- auto_resize = false,
        -- custom_sort = nil,
        -- keys = {
        -- expand_or_jump = 'o',
        -- quit = "q",
        -- },
    -- },
    -- map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opt),
    -- map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt),
    -- map("n","<leader>so", "<cmd>Lspsaga outline<CR>", opt)
-- })

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

-- require("which-key").setup {
    -- -- your configuration comes here
    -- -- or leave it empty to use the default settings
    -- -- refer to the configuration section below
-- }

require("ibl").setup {
    scope = { enabled = false },
}

-- require("dressing").setup({
  -- input = {
    -- -- Set to false to disable the vim.ui.input implementation
    -- enabled = true,
-- 
    -- -- Default prompt string
    -- default_prompt = "Input:",
-- 
    -- -- Can be 'left', 'right', or 'center'
    -- title_pos = "left",
-- 
    -- -- When true, <Esc> will close the modal
    -- insert_only = true,
-- 
    -- -- When true, input will start in insert mode.
    -- start_in_insert = true,
-- 
    -- -- These are passed to nvim_open_win
    -- border = "rounded",
    -- -- 'editor' and 'win' will default to being centered
    -- relative = "cursor",
-- 
    -- -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- prefer_width = 40,
    -- width = nil,
    -- -- min_width and max_width can be a list of mixed types.
    -- -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    -- max_width = { 140, 0.9 },
    -- min_width = { 20, 0.2 },
-- 
    -- buf_options = {},
    -- win_options = {
      -- -- Window transparency (0-100)
      -- winblend = 10,
      -- -- Disable line wrapping
      -- wrap = false,
      -- -- Indicator for when text exceeds window
      -- list = true,
      -- listchars = "precedes:…,extends:…",
      -- -- Increase this for more context when text scrolls off the window
      -- sidescrolloff = 0,
    -- },
-- 
    -- -- Set to `false` to disable
    -- mappings = {
      -- n = {
        -- ["<Esc>"] = "Close",
        -- ["<CR>"] = "Confirm",
      -- },
      -- i = {
        -- ["<C-c>"] = "Close",
        -- ["<CR>"] = "Confirm",
        -- ["<Up>"] = "HistoryPrev",
        -- ["<Down>"] = "HistoryNext",
      -- },
    -- },
-- 
    -- override = function(conf)
      -- -- This is the config that will be passed to nvim_open_win.
      -- -- Change values here to customize the layout
      -- return conf
    -- end,
-- 
    -- -- see :help dressing_get_config
    -- get_config = nil,
  -- },
  -- select = {
    -- -- Set to false to disable the vim.ui.select implementation
    -- enabled = true,
-- 
    -- -- Priority list of preferred vim.select implementations
    -- backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
-- 
    -- -- Trim trailing `:` from prompt
    -- trim_prompt = true,
-- 
    -- -- Options for telescope selector
    -- -- These are passed into the telescope picker directly. Can be used like:
    -- -- telescope = require('telescope.themes').get_ivy({...})
    -- telescope = nil,
-- 
    -- -- Options for fzf selector
    -- fzf = {
      -- window = {
        -- width = 0.5,
        -- height = 0.4,
      -- },
    -- },
-- 
    -- -- Options for fzf-lua
    -- fzf_lua = {
      -- -- winopts = {
      -- --   height = 0.5,
      -- --   width = 0.5,
      -- -- },
    -- },
-- 
    -- -- Options for built-in selector
    -- builtin = {
      -- -- Display numbers for options and set up keymaps
      -- show_numbers = true,
      -- -- These are passed to nvim_open_win
      -- border = "rounded",
      -- -- 'editor' and 'win' will default to being centered
      -- relative = "editor",
-- 
      -- buf_options = {},
      -- win_options = {
        -- -- Window transparency (0-100)
        -- winblend = 10,
        -- cursorline = true,
        -- cursorlineopt = "both",
      -- },
-- 
      -- -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- -- the min_ and max_ options can be a list of mixed types.
      -- -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      -- width = nil,
      -- max_width = { 140, 0.8 },
      -- min_width = { 40, 0.2 },
      -- height = nil,
      -- max_height = 0.9,
      -- min_height = { 10, 0.2 },
-- 
      -- -- Set to `false` to disable
      -- mappings = {
        -- ["<Esc>"] = "Close",
        -- ["<C-c>"] = "Close",
        -- ["<CR>"] = "Confirm",
      -- },
-- 
      -- override = function(conf)
        -- -- This is the config that will be passed to nvim_open_win.
        -- -- Change values here to customize the layout
        -- return conf
      -- end,
    -- },
-- 
    -- -- Used to override format_item. See :help dressing-format
    -- format_item_override = {},
-- 
    -- -- see :help dressing_get_config
    -- get_config = nil,
  -- },
-- })

require("noice").setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {}, -- global options for the cmdline. See section on views
    ---@type table<string, CmdlineFormat>
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = {}, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
  },
  ---@type NoicePresets
  presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  ---@type NoiceConfigViews
  views = {}, ---@see section on views
  ---@type NoiceRouteConfig[]
  routes = {}, --- @see section on routes
  ---@type table<string, NoiceFilter>
  status = {}, --- @see section on statusline components
  ---@type NoiceFormatOptions
  format = {}, --- @see section on formatting
})

require("trouble").setup()
vim.keymap.set('n', '<leader>tr', ':Trouble<CR>', {})

require("persistence").setup()
vim.keymap.set("n", "<leader>ps", [[<cmd>lua require("persistence").load()<cr>]], {})

-- require'window-picker'.setup()

require("go").setup()

require("symbols-outline").setup()
vim.keymap.set("n", "<leader>so", ":SymbolsOutline<CR>")
require('nvim-treesitter.configs').setup {
    textsubjects = {
        enable = true,
        -- prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['i;'] = 'textsubjects-smart',
            -- [';'] = 'textsubjects-container-outer',
            -- ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
        },
    },
}

require("lspconfig").gopls.setup{}

require("notify").setup({
  timeout = 2000,
  stages = 'static'
})

-- vim.o.backgroud = 'dark'
vim.cmd('colorscheme catppuccin-mocha')
