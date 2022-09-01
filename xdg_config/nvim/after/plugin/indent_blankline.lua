-- config for indent blankline

-- show newline character etc
vim.opt.list = true
vim.opt.listchars = { eol = "↲" }
vim.opt.fillchars = { eob = "~" }

require("indent_blankline").setup({
  char = "»",
  use_treesitter = false,
  show_trailing_blankline_indent = false,

  filetype_exclude = {
    "netrw",
    "lspinfo",
    "packer",
    "checkhealth",
    "help",
    "man",
    "",
    "lua",
    "javascript",
    "svelte",
    "html",
    "css",
  },

  buftype_exclude = {
    "terminal",
    "nofile",
    "quickfix",
    "prompt",
  },
})
