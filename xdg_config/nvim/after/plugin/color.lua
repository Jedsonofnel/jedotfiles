-- colorscheme setup: NIGHTFOX
require("nightfox").setup({
  options = {
    transparent = false,
    terminal_colors = true,
    dim_inactive = false,
    styles = {
      comments = "italic",
      functions = "italic,bold",
    },
  },
  groups = {
    nightfox = {
      IndentBlanklineChar = { fg = "bg3"},
      NonText = { fg = "bg3" },
    }
  }
})

vim.cmd("colorscheme nightfox")
