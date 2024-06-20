return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'preservim/nerdcommenter'
  use 'tpope/vim-fugitive'
  use 'christoomey/vim-tmux-navigator'
  use 't9md/vim-choosewin'
  -- colorscheme
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
  'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'folke/flash.nvim'
  -- completion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- nvim-autopairs
  use 'windwp/nvim-autopairs'
  use {
   'nvim-lualine/lualine.nvim',
   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'nvim-treesitter/nvim-treesitter'
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "akinsho/toggleterm.nvim"
  use 'lewis6991/gitsigns.nvim'
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })

  use {"lukas-reineke/indent-blankline.nvim", main = "ibl"}
  use {'MunifTanjim/nui.nvim'}
  use {'folke/noice.nvim'}
  use {'Mr-LLLLL/interestingwords.nvim'}

  use 'folke/trouble.nvim'
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support

  use 'stevearc/conform.nvim'
  use 'folke/persistence.nvim'
  use 'stevearc/dressing.nvim'
  use 'rcarriga/nvim-notify'
  use { "anuvyklack/windows.nvim",
        requires = "anuvyklack/middleclass" }
  use 'hedyhli/outline.nvim'
  use 'neovim/nvim-lspconfig'
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'roxma/vim-tmux-clipboard'
end)
