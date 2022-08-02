-- lsp handler options

local nnoremap_bufnr = require("jedn.utils").nnoremap_bufnr
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
        update_in_insert = true,
        float = {
            style = "minimal",
            border = "rounded",
            source = "if_many",
            header = "",
            prefix = "",
        }
    })
end

M.on_attach = function(_, bufnr)
    -- diagnostic stuff
    nnoremap_bufnr(bufnr, "<leader>de", "<cmd>lua vim.diagnostic.open_float()<CR>")
    nnoremap_bufnr(bufnr, "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    nnoremap_bufnr(bufnr, "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    nnoremap_bufnr(bufnr, "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
end

return M
