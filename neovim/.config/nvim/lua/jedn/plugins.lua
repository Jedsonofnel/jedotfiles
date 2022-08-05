-- Plugins using packer!

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Color stuff
  use("norcalli/nvim-colorizer.lua")
  use({
    "rose-pine/neovim",
    as = "rose-pine",
  })

  -- Treesitter for syntax highlighting goodness!
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  -- statusline
  use({
    "NTBBloodbath/galaxyline.nvim",
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

  -- all things lsp!
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("nvim-lua/lsp_extensions.nvim")

  -- utility
  use("kyazdani42/nvim-web-devicons")
  use("ahmedkhalf/project.nvim")
  use("windwp/nvim-autopairs")
  use("nvim-lua/plenary.nvim")
end)
