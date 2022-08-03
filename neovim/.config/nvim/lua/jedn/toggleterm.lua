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

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

local lazygit_toggle = function()
	lazygit:toggle()
end

nnoremap("<leader>g", lazygit_toggle, { silent = true, buffer = 0 })
