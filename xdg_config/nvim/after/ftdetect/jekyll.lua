-- html files starting with top matter is a jekyll liquid template
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.html",
	callback = function()
		local lines = vim.api.nvim_buf_get_lines(0, 0, 3, false)
		local filepath = vim.api.nvim_buf_get_name(0)

		if #lines >= 1 and lines[1] == "---" or
			filepath:match("/_includes/") or
			filepath:match("/_layouts/") then
			vim.bo.filetype = "liquid"
		end
	end,
})
