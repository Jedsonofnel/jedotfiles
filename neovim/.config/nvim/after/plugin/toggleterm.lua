-- toggleterm config

local nnoremap = require("jedn.utils").nnoremap

require("toggleterm").setup({
	size = 15,
	persist_size = false,
	hide_numbers = true,
	shade_terminals = true,
	direction = "horizontal",

	open_mapping = "<leader>tt",
	start_in_insert = true,
	insert_mappings = false,
	terminal_mappings = false,

	close_on_exit = true,
})
