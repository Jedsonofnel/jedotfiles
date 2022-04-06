--
-- jedn nvim config
-- indent blankline plugin settings
--

require("indent_blankline").setup {
  context_patterns  = {
	  "class",
	  "return",
	  "function",
	  "method",
	  "^if",
	  "^while",
	  "jsx_element",
	  "^for",
	  "^object",
	  "^table",
	  "block",
	  "arguments",
	  "if_statement",
	  "else_clause",
	  "jsx_element",
	  "jsx_self_closing_element",
	  "try_statement",
	  "catch_clause",
	  "import_statement",
	  "operation_type",
    "type_definition",
  },
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  show_first_indent_level = true,
  filetype_exclude = {'help'},
  buftype_exclude = {'terminal', 'nofile'},
  show_trailing_blankline_indent = false,
}
