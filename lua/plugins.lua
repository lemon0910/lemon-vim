return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lfv89/vim-interestingwords'
  use 'preservim/nerdcommenter'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'christoomey/vim-tmux-navigator'
  use 't9md/vim-choosewin'
  use 'tpope/vim-unimpaired'
  -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'glepnir/zephyr-nvim'
  use 'rebelot/kanagawa.nvim'
  use 'sainnhe/gruvbox-material'
  use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  use { 'Mofiqul/vscode.nvim' }
  use {
  'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'
  }
  -- hop
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }
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

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    event = "LspAttach",
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
            require("barbecue").setup()
    end,
  })

  -- nvim-autopairs
  use 'windwp/nvim-autopairs'
  use {
   'nvim-lualine/lualine.nvim',
   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- vim-ripgrep
  use 'jremmen/vim-ripgrep'
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

  use {'srcery-colors/srcery-vim', as = 'srcery'}
  use {'AstroNvim/astrotheme'}
  use {'NMAC427/guess-indent.nvim'}
  use {'folke/which-key.nvim'}
  use {"lukas-reineke/indent-blankline.nvim"}
  use {'onsails/lspkind.nvim'}
  use {'stevearc/dressing.nvim'}
end)
