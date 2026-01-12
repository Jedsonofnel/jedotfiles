-- Use tabs, not spaces
vim.opt_local.expandtab = false

-- Tab width is 8 characters
vim.opt_local.tabstop = 8
vim.opt_local.shiftwidth = 8
vim.opt_local.softtabstop = 8

-- Line length (80 is traditional kernel style, though 100 is sometimes used)
vim.opt_local.textwidth = 80

-- Formatting options for comments and text
vim.opt_local.formatoptions = vim.opt_local.formatoptions
	+ 'c' -- Auto-wrap comments using textwidth
	+ 'r' -- Auto-insert comment leader after <Enter>
	+ 'o' -- Auto-insert comment leader after 'o' or 'O'
	+ 'q' -- Allow formatting comments with 'gq'
	- 't' -- Don't auto-wrap text using textwidth
	- 'a' -- Don't auto-format paragraphs
