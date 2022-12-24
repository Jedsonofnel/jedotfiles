local status, zenmode = pcall(require, "zen-mode")
if not status then
  return
end

zenmode.setup({
  window = {
    width = 90,
    options = {
      number = false,
      relativenumber = false,
    },
  },
})

vim.keymap.set("n", "<leader>zz", function()
  require("zen-mode").toggle()
  vim.wo.wrap = false
  ColorSettings()
end)
