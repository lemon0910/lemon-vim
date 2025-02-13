return {
  {
    dir = "~/.local/share/nvim/lazy/nvim-web-devicons",
    lazy = false,
    priority = 1000
  },
  {
    dir = "~/.local/share/nvim/lazy/catppuccin",
    -- config = function()
    --   vim.cmd.colorscheme "catppuccin-mocha"
    -- end,
    -- priority = 2000
  },
  {
    dir = "~/.local/share/nvim/lazy/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
    end,
    priority = 2000,
    opts = {},
  }
}
