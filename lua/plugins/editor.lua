return {
  {
    dir = "~/.local/share/nvim/lazy/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    opts = {
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
    },
    keys = { 
      {"<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "open dir tree" },
    },
  },

  {
    dir = "~/.local/share/nvim/lazy/bufferline.nvim",
    opts = {
      options = {
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left"
        }},
      }
    },
  },
  
  {
    dir = "~/.local/share/nvim/lazy/lualine.nvim",
    opts = {
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
    }
  },

  {
    dir = "~/.local/share/nvim/lazy/trouble.nvim",
    opts = {},
    keys = {
      { "<leader>tr", "<cmd>Trouble<cr>" },
    }
  },

  {
    dir = "~/.local/share/nvim/lazy/telescope.nvim",
    cmd = "Telescope",
    init = function()
      local builtin = require('telescope.builtin')
      local actions = require("telescope.actions")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
      vim.keymap.set('n', '<leader>fm', builtin.marks, {})
      vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
      vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('n', '<leader>fc', builtin.commands, {})
      vim.keymap.set('n', '<leader>fr', builtin.resume, {})
      vim.keymap.set('n', 'gs', builtin.grep_string, {})
      vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    end,
    opts = function()
      local builtin = require('telescope.builtin')
      local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open

      -- Use this to add more results without clearing the trouble list
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--no-heading",
            "--with-filename",
            "--color=never",
            "--line-number",
            "--column",
            "--smart-case",
          },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<esc>"] = actions.close,
              ["<c-t>"] = open_with_trouble,
            },
            n = { ["<c-t>"] = open_with_trouble },
          },
          prompt_prefix = "   ",
          -- sorting_strategy = "ascending",
          -- layout_config = {
          --   horizontal = {
          --     prompt_position = "top",
          --   },
          -- },
        },
      }
    end,
  },

  {
    dir = "~/.local/share/nvim/lazy/telescope-fzf-native.nvim"
  },

  {
    dir = "~/.local/share/nvim/lazy/gitsigns.nvim",
    lazy = false,
    opts = {
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
    },
    keys = {
      { "<leader>gb", "<cmd>Gitsigns blame<cr>" },
    },
  },

  {
    dir = "~/.local/share/nvim/lazy/dressing.nvim"
  },

  {
    dir = "~/.local/share/nvim/lazy/nvim-notify",
    opts = {
      timeout = 2000,
      stages = 'static'
    }
  },

  {
    dir = "~/.local/share/nvim/lazy/nui.nvim"
  },

  {
    dir = "~/.local/share/nvim/lazy/noice.nvim",
    opts = {
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
    }
  },

  {
    dir = "~/.local/share/nvim/lazy/interestingwords.nvim",
    opts = {
      search_count = true,
      navigation = true,
      color_key = "<leader>k",
      cancel_color_key = "<leader>K",
    },
  },

  {
    dir = "~/.local/share/nvim/lazy/persistence.nvim",
    keys = {
      { "<leader>ps", '<cmd>lua require("persistence").load()<cr>' },
    }
  },

  {
    dir = "~/.local/share/nvim/lazy/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
  },
}
