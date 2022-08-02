-- lsp handler options

local nnoremap_bufnr = require("jedn.utils").nnoremap_bufnr
local M = {}

-- M.capabilities = vim.lsp.protocol.make_client_capabilites()

M.on_attach = function(client, bufnr)
    -- diagnostic stuff
    nnoremap_bufnr(bufnr, "<leader>de", "<cmd>lua vim.diagnostic.open_float()<CR>")
    nnoremap_bufnr(bufnr, "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    nnoremap_bufnr(bufnr, "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    nnoremap_bufnr(bufnr, "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
end

return M
