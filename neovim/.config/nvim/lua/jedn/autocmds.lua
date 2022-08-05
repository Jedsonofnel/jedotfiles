-- autocommands defined here and setup using util func

local create_augroups = require("jedn.utils").create_augroups

local autocmds = {
	terminal_job = {
		{ "TermOpen", "*", "startinsert" },
		{ "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" },
	},
}

create_augroups(autocmds)
