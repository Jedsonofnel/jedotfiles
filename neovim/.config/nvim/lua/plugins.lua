--
-- jedn nvim config
-- plugin management with packer
--

local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- autocommand that reloads neovim whenever you save this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
  -- packer itself and basic required plugins
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- svelte syntax highlighting
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'

  -- colorscheme
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v1.*',
    config = function()
      require('plugins.colorscheme')
    end
  }

  -- nvim inbuilt lsp config + lsp-installer
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp')
    end
  }
  use 'williamboman/nvim-lsp-installer'

  -- statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt=true },
    config = function()
      require('plugins.lualine')
    end
  }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.filetree')
    end
  }

  -- syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = { 'nvim-treesitter/playground'},
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end
  }

  -- fuzzy file finder and much more
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' }
    },
    config = function()
      require('plugins.telescope')
    end
  }

  -- makes rgb codes colorer
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  -- displays open buffers above
  use {
    'romgrk/barbar.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('plugins.bufferline')
    end
  }

  -- makes tabs more visible
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.indentline')
    end
  }

  -- snippets and completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.completion')
    end
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- use 'rafamadriz/friendly-snippets'

  -- gitsigns
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('plugins.gitsigns')
  --   end
  -- }

  -- autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugins.autopairs')
    end
  }

  -- null ls
  use {
    'jose-elias-alvarez/null-ls.nvim'
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('plugins.toggleterm')
    end
  }

  -- project
  use 'ahmedkhalf/project.nvim'

  -- for highlighting
  use "RRethy/vim-illuminate"

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
