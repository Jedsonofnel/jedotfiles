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

-- Export the functions
return {
	files_with_hidden = pick_files_with_hidden,
}
