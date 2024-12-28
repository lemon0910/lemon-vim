-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

-- plugin config

require("snacks").setup({
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    quickfile = { enabled = true },
})

vim.api.nvim_create_user_command("GitBrowse", 'lua Snacks.gitbrowse()', { desc = "GitBrowse" })
map("n", "<leader>gl", ":lua Snacks.lazygit()<CR>", opt)
map("n", "<leader>`", ":lua Snacks.terminal()<CR>", opt)

-- vim-interestingwords {{{
require("interestingwords").setup {
  -- colors = { '#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b' },
  search_count = true,
  navigation = true,
  color_key = "<leader>k",
  cancel_color_key = "<leader>K",
}
-- }}}

-- a.vim {{{
-- .h和.c切换相关
map("n", "<leader>aa", ":A<CR>", opt)
-- }}}

-- t9md/vim-choosewin {
-- map("n", "<leader>o", ":ChooseWin<CR>", opt)
  vim.cmd('nmap  -  <Plug>(choosewin)')
-- }

-- kyazdani42/nvim-tree.lua
-- empty setup using defaults
-- OR setup with some options

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return {
      desc = 'nvim-tree: ' .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
  }
  end

  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>',   api.tree.change_root_to_node,        opts('CD'))
  vim.keymap.set('n', '<C-e>',   api.node.open.replace_tree_buffer,   opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>',   api.node.show_info_popup,            opts('Info'))
  vim.keymap.set('n', '<C-r>',   api.fs.rename_sub,                   opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>',   api.node.open.tab,                   opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>',   api.node.open.vertical,              opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>',   api.node.open.horizontal,            opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,      opts('Close Directory'))
  vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
  vim.keymap.set('n', '<Tab>',   api.node.open.preview,               opts('Open Preview'))
  vim.keymap.set('n', '>',       api.node.navigate.sibling.next,      opts('Next Sibling'))
  vim.keymap.set('n', '<',       api.node.navigate.sibling.prev,      opts('Previous Sibling'))
  vim.keymap.set('n', '.',       api.node.run.cmd,                    opts('Run Command'))
  vim.keymap.set('n', '-',       api.tree.change_root_to_parent,      opts('Up'))
  vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
  vim.keymap.set('n', 'bd',      api.marks.bulk.delete,               opts('Delete Bookmarked'))
  vim.keymap.set('n', 'bt',      api.marks.bulk.trash,                opts('Trash Bookmarked'))
  vim.keymap.set('n', 'bmv',     api.marks.bulk.move,                 opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',       api.tree.toggle_no_buffer_filter,    opts('Toggle Filter: No Buffer'))
  vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
  vim.keymap.set('n', 'C',       api.tree.toggle_git_clean_filter,    opts('Toggle Filter: Git Clean'))
  vim.keymap.set('n', '[c',      api.node.navigate.git.prev,          opts('Prev Git'))
  vim.keymap.set('n', ']c',      api.node.navigate.git.next,          opts('Next Git'))
  vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
  vim.keymap.set('n', 'D',       api.fs.trash,                        opts('Trash'))
  vim.keymap.set('n', 'E',       api.tree.expand_all,                 opts('Expand All'))
  vim.keymap.set('n', 'e',       api.fs.rename_basename,              opts('Rename: Basename'))
  vim.keymap.set('n', ']e',      api.node.navigate.diagnostics.next,  opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',      api.node.navigate.diagnostics.prev,  opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Live Filter: Clear'))
  vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Live Filter: Start'))
  vim.keymap.set('n', 'g?',      api.tree.toggle_help,                opts('Help'))
  vim.keymap.set('n', 'gy',      api.fs.copy.absolute_path,           opts('Copy Absolute Path'))
  vim.keymap.set('n', 'ge',      api.fs.copy.basename,                opts('Copy Basename'))
  vim.keymap.set('n', 'H',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
  vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
  vim.keymap.set('n', 'J',       api.node.navigate.sibling.last,      opts('Last Sibling'))
  vim.keymap.set('n', 'K',       api.node.navigate.sibling.first,     opts('First Sibling'))
  vim.keymap.set('n', 'L',       api.node.open.toggle_group_empty,    opts('Toggle Group Empty'))
  vim.keymap.set('n', 'M',       api.tree.toggle_no_bookmark_filter,  opts('Toggle Filter: No Bookmark'))
  vim.keymap.set('n', 'm',       api.marks.toggle,                    opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',       api.node.open.edit,                  opts('Open'))
  vim.keymap.set('n', 'O',       api.node.open.no_window_picker,      opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
  vim.keymap.set('n', 'P',       api.node.navigate.parent,            opts('Parent Directory'))
  vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
  vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
  vim.keymap.set('n', 'R',       api.tree.reload,                     opts('Refresh'))
  vim.keymap.set('n', 's',       function() require("flash").jump() end, opts('flash'))
  vim.keymap.set('n', 'S',       api.tree.search_node,                opts('Search'))
  vim.keymap.set('n', 'u',       api.fs.rename_full,                  opts('Rename: Full Path'))
  vim.keymap.set('n', 'U',       api.tree.toggle_custom_filter,       opts('Toggle Filter: Hidden'))
  vim.keymap.set('n', 'W',       api.tree.collapse_all,               opts('Collapse'))
  vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
  vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
  vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH
end

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
  on_attach = my_on_attach,
  map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)
})
--}

-- bufferline
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
require("flash").toggle()
vim.keymap.set({'n', 'v', 'o'}, 's', function() require("flash").jump() end, {})

-- lualine
require('lualine').setup({
    options = {
        component_separators = '',
        -- section_separators = { left = '', right = '' },
    },
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
      -- border = "rounded"
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
  ensure_installed = {"c", "cpp", "vim", "lua", "go", "python", "vimdoc", "query", "markdown", "markdown_inline" },
  ignore_install = { },
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {"lua"},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<A-=>",
      node_incremental = "<A-=>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
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
  vim.keymap.set('n', '<leader>fo', builtin.resume, {}),
  vim.keymap.set('n', 'gs', builtin.grep_string, {}),
  vim.keymap.set('n', 'gr', builtin.lsp_references, {})
}

-- gitsigns
require('gitsigns').setup {
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
}

map("n", "<leader>gb", ":Gitsigns blame<CR>", opt)

-- alpha
require'alpha'.setup(require'alpha.themes.startify'.config)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

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

require("ibl").setup {
    scope = { enabled = false },
}

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

require("go").setup()
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
    vim.keymap.set('n', '<A-k>', vim.lsp.buf.signature_help, opts)
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

require("lspconfig").gopls.setup{}

local util = require 'lspconfig.util'

-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
  local params = { uri = vim.uri_from_bufnr(bufnr) }
  if clangd_client then
    clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
      if err then
        error(tostring(err))
      end
      if not result then
        print 'Corresponding file cannot be determined'
        return
      end
      vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
    end, bufnr)
  else
    print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
  end
end

local root_files = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = { 'utf-8', 'utf-16' },
}

require("lspconfig").clangd.setup{
    cmd = { '/usr/bin/clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname)
    end,
    single_file_support = false,
    capabilities = default_capabilities,
}

require("lspconfig").pyright.setup({
  cmd = {'/usr/local/bin/pyright-langserver', '--stdio'},
  filetypes = { 'python' },
  single_file_support = true,
})

require("notify").setup({
  timeout = 2000,
  stages = 'static',
})

require("aerial").setup({
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>ae", "<cmd>AerialToggle!<CR>")

require("yanky").setup({
})
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "[p", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "]p", "<Plug>(YankyNextEntry)")

require('render-markdown').setup({})

vim.cmd('colorscheme catppuccin-mocha')
