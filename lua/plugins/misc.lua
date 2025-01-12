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
            cmd = "git status --short --branch --renames",
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
      scroll = { enabled = true },
    },
    keys = {
      { "<leader>gl", "<cmd>lua Snacks.lazygit()<cr>" },
      { "<leader>`", "<cmd>lua Snacks.terminal()<cr>" },
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
  },

  {
    dir = "~/.local/share/nvim/lazy/plenary.nvim"
  }
}
