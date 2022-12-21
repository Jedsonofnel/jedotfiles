-- config for indent blankline

-- show newline character etc
vim.opt.list = true
vim.opt.listchars = { eol = "↲" }
vim.opt.fillchars = { eob = "~" }

local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

indent_blankline.setup({
  char = "│",
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
  show_current_context = false,
  show_current_context_start = false,

  filetype_exclude = {
    "netrw",
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "man",
    "",
  },

  buftype_exclude = {
    "terminal",
    "nofile",
    "quickfix",
    "prompt",
  },
})
