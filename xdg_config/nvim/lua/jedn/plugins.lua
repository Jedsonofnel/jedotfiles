local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- required for a bunch
  use("nvim-lua/plenary.nvim")

  -- Color stuff
  use("EdenEast/nightfox.nvim")
  use("norcalli/nvim-colorizer.lua")

  use("lukas-reineke/indent-blankline.nvim")

  -- Treesitter for syntax highlighting goodness!
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

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
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- language plugins
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
  use("windwp/nvim-ts-autotag")

  if packer_bootstrap then
    packer.sync()
  end
end)
