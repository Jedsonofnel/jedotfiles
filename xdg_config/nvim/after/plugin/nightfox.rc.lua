-- colorscheme setup: NIGHTFOX
local ok, nightfox = pcall(require, "nightfox")
if not ok then
  return
end

nightfox.setup({
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
      IndentBlanklineChar = { fg = "bg3", style = "nocombine" },
      NonText = { fg = "bg3" },
    },
    carbonfox = {
      IndentBlanklineChar = { fg = "bg3", style = "nocombine" },
      NonText = { fg = "bg3" },
    },
  },
})
