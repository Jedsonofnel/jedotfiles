vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.do",
	callback = function()
		vim.bo.filetype = "do"
	end
})
