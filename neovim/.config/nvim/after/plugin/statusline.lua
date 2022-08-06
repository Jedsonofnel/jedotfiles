require("lualine").setup({
  options = {
    icons_enable = true,
    theme = "rose-pine",

    section_separators = { left = "", right = "" },
    component_separators = { left = "|", right = "|" },

    refresh = {
      statusline = 1000,
    },
  },
  winbar = {
    lualine_c = { "filename" },
  },
  inactive_winbar = {
    lualine_c = { "filename" },
  },
})
