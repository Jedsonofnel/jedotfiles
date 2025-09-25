local S = {}

S.open_do = function()
	local root = vim.fs.root(0, '.git')
	print(root)
end

local function clear_colourscheme_cache()
	for name, _ in pairs(package.loaded) do
		if name:match("^colors%.") or
			name:match("colorscheme") or
			name:match("base16") then
			package.loaded[name] = nil
		end
	end

	vim.cmd("highlight clear")
end


S.reload_colourscheme = function()
	local current = vim.g.colors_name

	clear_colourscheme_cache()
	if current then
		vim.cmd.highlight("clear")
		vim.cmd.colorscheme(current)
	end
end

return S
