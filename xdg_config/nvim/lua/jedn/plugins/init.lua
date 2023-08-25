------- PLUGINS -------

return {
  -- Aesthetics
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1001,
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("tokyonight")
    -- end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("gruvbox")
    -- end,
  },

  -- Treesitter for syntax highlighting goodness!
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = false },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = "all",
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
