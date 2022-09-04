-- config for indent blankline

-- show newline character etc
vim.opt.list = true
vim.opt.listchars = { eol = "↲" }
vim.opt.fillchars = { eob = "~" }

require("indent_blankline").setup({
  char = "▏",
  context_char = "▏",
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,

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
