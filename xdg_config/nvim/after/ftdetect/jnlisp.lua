-- jnlisp files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.jnl",
	callback = function()
		vim.bo.filetype = "jnlisp"
	end
})
