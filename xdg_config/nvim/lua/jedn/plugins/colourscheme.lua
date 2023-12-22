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
    lazy = false,
    priority = 1000,

    config = function(_, opts)
      require("dracula").setup(opts)
      vim.cmd.colorscheme("dracula")
    end,
  },
}
