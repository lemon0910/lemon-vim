return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lfv89/vim-interestingwords'
  use 'preservim/nerdcommenter'
  use 'mbbill/undotree'
  use 'mhinz/vim-startify'
  use 'tpope/vim-fugitive'
  use 'christoomey/vim-tmux-navigator'
  use 't9md/vim-choosewin'
  use 'tpope/vim-unimpaired'
  -- colorscheme
  use 'tiagovla/tokyodark.nvim'
  use 'glepnir/zephyr-nvim'
  use "rebelot/kanagawa.nvim"
  use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons'
  }
  -- hop
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
  }
  -- completion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- nvim-autopairs
  use 'windwp/nvim-autopairs'
  -- galaxyline
  use({
    "NTBBloodbath/galaxyline.nvim",
    -- some optional icons
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  })
  -- telescope
  -- use {
    -- 'nvim-telescope/telescope.nvim',
    -- requires = {{'nvim-lua/plenary.nvim'}}
  -- }
  -- tags
  use 'ludovicchabant/vim-gutentags'
  use 'skywind3000/gutentags_plus'
  -- fzf
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'pbogut/fzf-mru.vim'
  -- highlight
  use 'octol/vim-cpp-enhanced-highlight'
  -- vim-ags
  use 'gabesoft/vim-ags'
  use 'nvim-treesitter/nvim-treesitter'
end)
