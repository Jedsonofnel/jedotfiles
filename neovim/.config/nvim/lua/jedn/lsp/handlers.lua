-- lsp handler options

local nnoremap = require("jedn.utils").nnoremap
local M = {}

-- run at startup
M.setup = function()
	-- better diagnostic icons
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	vim.diagnostic.config({
		virtual_lines = false,
		virtual_text = false,
		signs = true,
		underline = true,
		severity_sort = true,
		update_in_insert = false,
		float = {
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		},
	})
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
	-- diagnostic stuff
	nnoremap("<leader>de", vim.diagnostic.open_float, { buffer = bufnr })
	nnoremap("<leader>dp", vim.diagnostic.goto_prev, { buffer = bufnr })
	nnoremap("<leader>dn", vim.diagnostic.goto_next, { buffer = bufnr })
	nnoremap("<leader>dl", vim.diagnostic.setloclist, { buffer = bufnr })

	-- lsp stuff
	nnoremap("<leader>ld", vim.lsp.buf.definition, { buffer = bufnr })
	nnoremap("<leader>lD", vim.lsp.buf.declaration, { buffer = bufnr })
	nnoremap("<leader>lf", function()
		lsp_formatting(bufnr)
	end, { buffer = bufnr })

	-- formatting with null-ls only/on save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

return M
