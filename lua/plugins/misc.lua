return {
  {
    dir = "~/.local/share/nvim/lazy/vim-tmux-navigator",
  },

  {
    dir = "~/.local/share/nvim/lazy/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    init = function()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      quickfile = { enabled = true },
      indent = { enabled = true },                                                     
      input = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },
      scope = { enabled = true },
      words = { enabled = true },
      statuscolumn = { enabled = true },
      explorer = { enabled = true },
      picker = {
        layout = {
          cycle = true,
          --- Use the default layout or vertical if the window is too narrow
          preset = function()
            return vim.o.columns >= 120 and "default" or "vertical"
          end,
        },
        ---@class snacks.picker.matcher.Config
        matcher = {
          fuzzy = true, -- use fuzzy matching
          smartcase = true, -- use smartcase
          ignorecase = true, -- use ignorecase
          sort_empty = false, -- sort results when the search string is empty
          filename_bonus = true, -- give bonus for matching file names (last part of the path)
          file_pos = true, -- support patterns like `file:line:col` and `file:line`
          -- the bonusses below, possibly require string concatenation and path normalization,
          -- so this can have a performance impact for large lists and increase memory usage
          cwd_bonus = false, -- give bonus for matching files in the cwd
          frecency = false, -- frecency bonus
          history_bonus = false, -- give more weight to chronological order
        },
        win = {
          -- input window
          input = {
            keys = {
              -- to close the picker on ESC instead of going to normal mode,
              -- add the following keymap to your config
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>gl", "<cmd>lua Snacks.lazygit()<cr>" },
      { "<leader>`", "<cmd>lua Snacks.terminal()<cr>" },
      -- Top Pickers & Explorer
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent" },
    -- Grep
    { "<leader>fs", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "gs", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    -- { "gr", function() Snacks.picker.lsp_references({ layout = { preset = "vertical" }}) end, nowait = true, desc = "References" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ft", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    -- git
    { "<leader>Gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>Gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>Gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- Other
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    }
  },

  {
    dir = "~/.local/share/nvim/lazy/nvim-treesitter",
    opts = {
      ensure_installed = {"c", "cpp", "vim", "lua", "go", "python", "vimdoc", "query", "markdown", "markdown_inline" },
      ignore_install = { },
      -- 启用代码高亮功能
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        -- keymaps = {
        --   init_selection = "<A-=>",
        --   node_incremental = "<A-=>",
        --   scope_incremental = false,
        --   node_decremental = "<bs>",
        -- },
      }
    }
  },

  {
    dir = "~/.local/share/nvim/lazy/nvim-treesitter-context",
    lazy = false,
    opts = {},
    keys = {
      { "<leader>n", function() require("treesitter-context").go_to_context(vim.v.count1) end, desc = "go to context" },
    },
  },

  {
    dir = "~/.local/share/nvim/lazy/plenary.nvim"
  }
}
