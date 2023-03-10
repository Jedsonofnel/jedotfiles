------- PLUGINS -------

return {
  -- required for a bunch
  "nvim-lua/plenary.nvim",

  -- Aesthetics
  "EdenEast/nightfox.nvim",
  "nyoom-engineering/oxocarbon.nvim",
  "norcalli/nvim-colorizer.lua",
  "rebelot/kanagawa.nvim",
  "folke/tokyonight.nvim",
  "lukas-reineke/indent-blankline.nvim",

  -- Treesitter for syntax highlighting goodness!
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
  },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- harpoon
  "theprimeagen/harpoon",

  -- language plugins
  "leafOfTree/vim-svelte-plugin",

  -- all things lsp!
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "nvim-lua/lsp_extensions.nvim",
  "onsails/lspkind.nvim",
  "jose-elias-alvarez/null-ls.nvim",

  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- utility
  "ahmedkhalf/project.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "folke/zen-mode.nvim",
}
