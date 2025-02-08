return {
  {
    dir = "~/.local/share/nvim/lazy/mini.comment",
    event = "VeryLazy",
  },

  {
    dir = "~/.local/share/nvim/lazy/flash.nvim",
    keys = {
      { "s", function() require("flash").jump() end, mode = { 'n', 'v', 'o' }, },
    },
  },

  {
    dir = "~/.local/share/nvim/lazy/cmp-buffer"
  },

  {
    dir = "~/.local/share/nvim/lazy/cmp-nvim-lsp"
  },

  {
    dir = "~/.local/share/nvim/lazy/nvim-cmp",
    event = "InsertEnter",
    opts = function()
      local cmp = require'cmp'
      return {
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect',
          com
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
      }
    end,
  },

  {
    dir = "~/.local/share/nvim/lazy/cmp-cmdline",
    init = function()
      local cmp = require'cmp'
      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      -- `:` cmdline setup.
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
    end
  },

  {
    dir = "~/.local/share/nvim/lazy/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  {
    dir = "~/.local/share/nvim/lazy/yanky.nvim",
    opts = {},
    keys = {
      { "[p", "<Plug>(YankyPreviousEntry)" },
      { "]p", "<Plug>(YankyNextEntry)" },

    }
  },

  {
    dir = "~/.local/share/nvim/lazy/compile-mode.nvim",
    config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
        -- to add ANSI escape code support, add:
        -- baleia_setup = true,
    }
  end
  },
}
