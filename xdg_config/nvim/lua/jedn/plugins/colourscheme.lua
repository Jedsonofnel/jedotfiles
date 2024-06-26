return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    -- priority = 1000,
    -- transparent floating windows (nicked from kanagawa repo)
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
    -- config = function(_, opts)
    --  require("kanagawa").setup(opts)
    --  vim.cmd.colorscheme("kanagawa")
    -- end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },

  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    -- priority = 1000,

    -- config = function(_, opts)
    --   require("dracula").setup(opts)
    --   vim.cmd.colorscheme("dracula")
    -- end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        bufferline = true,
      },
      custom_highlights = function(colors)
        return {
          IblIndent = { fg = colors.surface0 },
          netrwTreeBar = { fg = colors.surface1 },
        }
      end,
    },

    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
