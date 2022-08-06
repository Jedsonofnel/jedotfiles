-- lsp handler options

local nnoremap = require("jedn.utils").nnoremap
local M = {}

-- run at startup
M.setup = function()
  vim.diagnostic.config({
    underline = true,
    virtual_text = {
      severity = nil,
      source = "if_many",
      format = nil,
    },
    signs = true,
    float = {
      -- stole from teeeeej
      show_header = true,
      format = function(d)
        local t = vim.deepcopy(d)
        local code = d.code or d.user_data.lsp.code
        if code then
          t.message =
            string.format("%s [%s]", t.message, code):gsub("1. ", "")
        end
        return t.message
      end,
    },

    severity_sort = true,
    update_in_insert = false,
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
  nnoremap("<leader>de", function()
    vim.diagnostic.open_float(0, { scope = "line" })
  end, { buffer = bufnr })
  nnoremap("<leader>dp", function()
    vim.diagnostic.goto_prev({ wrap = true, float = true })
  end, { buffer = bufnr })
  nnoremap("<leader>dn", function()
    vim.diagnostic.goto_next({ wrap = true, float = true })
  end, { buffer = bufnr })

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
