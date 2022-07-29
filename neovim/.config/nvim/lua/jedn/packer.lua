-- Plugins using packer!

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colourscheme
  use 'folke/tokyonight.nvim'

  -- Treesitter for syntax highlighting goodness!
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- statusline
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- utility
  use 'ahmedkhalf/project.nvim'
  use 'windwp/nvim-autopairs'
end)
