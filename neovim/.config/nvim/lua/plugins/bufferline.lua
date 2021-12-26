--
-- jedn nvim config
-- bufferline plugin settings
--

require("bufferline").setup{
  options = { offsets = {
    {
      filetype = "NvimTree",
      text = function()
        return vim.fn.getcwd()
      end,
      highlight = "Directory",
      text_align = "left"
    }
  }}
}
