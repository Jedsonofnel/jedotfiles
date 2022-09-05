-- Plugins using packer!

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- required for a bunch
  use("nvim-lua/plenary.nvim")

  -- Color stuff
  use("norcalli/nvim-colorizer.lua")
  use({
    "rose-pine/neovim",
    as = "rose-pine",
  })

  use("lukas-reineke/indent-blankline.nvim")

  -- Treesitter for syntax highlighting goodness!
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- Treesitter for context thing
  use("nvim-treesitter/nvim-treesitter-context")

  -- statusline
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- toggleterm
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
  })

  -- telescope
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
  })

  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })

  -- langauge plugins
  use("leafOfTree/vim-svelte-plugin")

  -- all things lsp!
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("nvim-lua/lsp_extensions.nvim")
  use("onsails/lspkind.nvim")

  -- completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lua")

  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  -- utility
  use("kyazdani42/nvim-web-devicons")
  use("ahmedkhalf/project.nvim")
  use("windwp/nvim-autopairs")
end)
