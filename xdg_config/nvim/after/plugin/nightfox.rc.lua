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
      IndentBlanklineChar = { fg = "bg3" },
      NonText = { fg = "bg3" },
    },
  },
})

local function ColorSettings(color)
  color = color or "nightfox"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorSettings()
