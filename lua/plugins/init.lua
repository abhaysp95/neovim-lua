-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  ---------------------
  -- My plugins here --
  ---------------------

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- vim-tmux navigator
  use 'christoomey/vim-tmux-navigator'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- LSP stuffs
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'mfussenegger/nvim-jdtls'
  use 'mfussenegger/nvim-dap'

  use 'kevinhwang91/nvim-bqf'
  use 'airblade/vim-rooter'

  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- autopairs
  use 'windwp/nvim-autopairs'

  -- surround
  use 'blackCauldron7/surround.nvim'

  -- align text
  use 'godlygeek/tabular'

  -- treesitter (post-install/update hook with neovim command)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    -- requires = { 'p00f/nvim-ts-rainbow' }
  }

  -- tagviewer
  use 'liuchengxu/vista.vim'

  -- indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- start-page
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.opts)
    end
  }

  -- colorschemes
  use 'tanvirtin/monokai.nvim'
  use 'ayu-theme/ayu-vim'
  use 'romgrk/doom-one.vim'
  use 'cocopon/iceberg.vim'
  use 'whatyouhide/vim-gotham'
  use 'srcery-colors/srcery-vim'
  use 'sainnhe/gruvbox-material'
  use 'jacoborus/tender.vim'
  use 'jnurmine/Zenburn'
  use 'sainnhe/edge'
  use 'folke/tokyonight.nvim'
  use 'arzg/vim-colors-xcode'
	use 'norcalli/nvim-colorizer.lua'
  use 'yunlingz/equinusocio-material.vim'
  use 'ChristianChiarulli/nvcode-color-schemes.vim'
  use { 'bluz71/vim-nightfly-guicolors', as = 'nightfly' }
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- statusline
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim'
    }
  }

  -- telescope extension plugins
  use 'nvim-telescope/telescope-media-files.nvim'

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- floaterm
  use 'voldikss/vim-floaterm'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  ------------------------------------------
  -- custom modules for installed plugins --
  ------------------------------------------

  -- keybinds for installed plugins
  require('plugins.nvim-cmp')
  require('plugins.colorizer')
  require('plugins.nvim_tree')
  -- require('plugins.feline')  -- not a big fan of statuslines
  require('plugins.nvim-treesitter')
  require('plugins.gitsigns')
  require('plugins.nvim-autopairs')
  require('plugins.surround')
  require('plugins.nvim-treesitter')
  require('plugins.telescope')
  require('plugins.lspsaga')
  require('plugins.alpha-nvim')
  require('plugins.floaterm')
  require('plugins.indent-blankline')
  require('plugins.vista')
  require('plugins.nvim-lightbulb')
  require('plugins.plugin_keybindings')
end)
