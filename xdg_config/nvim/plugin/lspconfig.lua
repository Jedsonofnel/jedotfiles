-- lspconfig options (basically the backbone of all my lsp stuff)

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

-- remapping util func
local nnoremap = require("jedn.utils").nnoremap

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- using on_attach function to only do the mappings after lsp attaches
local on_attach = function(client, bufnr)
  -- keymaps
  nnoremap("<leader>de", function()
    vim.diagnostic.open_float(0, { scope = "line" })
  end, { buffer = bufnr })
  nnoremap("<leader>dp", function()
    vim.diagnostic.goto_prev({ wrap = true, float = true })
  end, { buffer = bufnr })
  nnoremap("<leader>dn", function()
    vim.diagnostic.goto_next({ wrap = true, float = true })
  end, { buffer = bufnr })
end

local protocol = require("vim.lsp.protocol")
protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  capabilites = capabilites,
})

nvim_lsp.sumneko_lua.setup({
  capabilites = capabilites,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  }
})

nvim_lsp.cssls.setup({
  on_attach = on_attach,
  capabilites = capabilites,
})

nvim_lsp.html.setup({
  on_attach = on_attach,
  capabilites = capabilites,
})

nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  capabilites = capabilites,
})

nvim_lsp.svelte.setup({
  on_attach = on_attach,
  capabilites = capabilites,
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
  capabilites = capabilites,
})

-- config how diagnostics look
vim.diagnostic.config({
  underline = true,
  virtual_text = {
    severity = nil,
    source = "if_many",
    format = nil,
  },
  signs = true,
  float = {
    focusable = true,
    style = "minimal",
    source = "if_many",
    header = "",
    prefix = "",
  },

  severity_sort = true,
  update_in_insert = false,
})
