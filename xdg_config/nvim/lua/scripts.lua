local S = {}

S.open_do = function()
	local root = vim.fs.root(0, '.git')
	print(root)
end

S.reload_colourscheme = function()
	local current = vim.g.colors_name
	if current then
		vim.cmd.highlight("clear")
		vim.cmd.colorscheme(current)
	end
end

return S
