return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    theme = "catppuccin",

    extensions = { "nvim-tree" },
  },

  config = function(_, options)
    require("lualine").setup(options)
  end,
}
