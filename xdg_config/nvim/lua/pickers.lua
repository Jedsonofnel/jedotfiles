-- Custom picker functions for mini.pick

-- Pick files including hidden files (respects .gitignore)
local function pick_files_with_hidden()
	if vim.fn.executable('fd') == 1 then
		require('mini.pick').start({
			source = {
				name = 'Files (with hidden)',
				items = function()
					local items = {}
					local handle = io.popen('fd --type f --hidden 2>/dev/null')
					if handle then
						for line in handle:lines() do
							table.insert(items, line)
						end
						handle:close()
					end
					return items
				end
			}
		})
	else
		-- Fallback to regular files if fd not available
		require('mini.pick').builtin.files()
	end
end

-- Simple Rails file navigator using tpope/rails.vim + mini.pick
local function pick_rails_related()
	local nav_commands = {
		{ cmd = 'Econtroller', label = 'Controller' },
		{ cmd = 'Emodel',      label = 'Model' },
		{ cmd = 'Eview',       label = 'View' },
		{ cmd = 'Espec',       label = 'Spec' },
		{ cmd = 'Efacade',     label = 'Facade' },
		{ cmd = 'Eform',       label = 'Form' },
		{ cmd = 'A',           label = 'Alternate' },
		{ cmd = 'R',           label = 'Related' },
	}

	require('mini.pick').start({
		source = {
			items = nav_commands,
			name = 'Rails Navigation',
			choose = function(item)
				vim.cmd(item.cmd)
			end,
			show = function(buf_id, items)
				local lines = {}
				for _, item in ipairs(items) do
					table.insert(lines, item.label .. ' (:' .. item.cmd .. ')')
				end
				vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
			end
		}
	})
end

-- Export the functions
return {
	files_with_hidden = pick_files_with_hidden,
	rails_related = pick_rails_related,
}
