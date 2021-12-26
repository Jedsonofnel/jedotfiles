--
-- jedn nvim config
-- indent blanline plugin settings
--

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  show_first_indent_level = true,
  filetype_exclude = {'help'},
  buftype_exclude = {'terminal', 'nofile'},
}
