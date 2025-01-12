return {
  {
    dir = "~/.local/share/nvim/lazy/nvim-web-devicons",
    priority = 1000
  },
  {
    dir = "~/.local/share/nvim/lazy/catppuccin",
    init = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
    priority = 2000
  }
}
