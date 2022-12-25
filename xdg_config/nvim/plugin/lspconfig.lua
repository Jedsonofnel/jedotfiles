-- lspconfig options (basically the backbone of all my lsp stuff)

local ok, nvim_lsp = pcall(require, "lspconfig")
if not ok then
  return
end

-- remapping util func
local nnoremap = require("jedn.utils").nnoremap

-- using on_attach function to only do the mappings after lsp attaches
local on_attach = function(_, bufnr)
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
  "", -- Text
  "", -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

local ok2, cmp = pcall(require, "cmp_nvim_lsp")
if not ok2 then
  return
end

local capabilities = cmp.default_capabilities()
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  capabilites = capabilities,
})

nvim_lsp.sumneko_lua.setup({
  capabilites = capabilities,
  on_attach = on_attach,
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
  },
})

nvim_lsp.cssls.setup({
  on_attach = on_attach,
  capabilites = capabilities,
})

nvim_lsp.html.setup({
  on_attach = on_attach,
  capabilites = capabilities,
})

nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  capabilites = capabilities,
})

nvim_lsp.svelte.setup({
  on_attach = on_attach,
  capabilites = capabilities,
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
  capabilites = capabilities,
})

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
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
