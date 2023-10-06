------- PLUGINS -------

return {
  -- Aesthetics
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    -- transparent floating windows (nicked from kanagawa repo)
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = {
            fg = theme.ui.fg_dim,
            bg = theme.ui.bg_m1,
          },
          TelescopeResultsBorder = {
            fg = theme.ui.bg_m1,
            bg = theme.ui.bg_m1,
          },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = {
            bg = theme.ui.bg_dim,
            fg = theme.ui.bg_dim,
          },
        }
      end,
    },
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
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
