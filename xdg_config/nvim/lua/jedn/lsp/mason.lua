-- using mason to install servers
-- as opposed to just manually downloading them urgh

local ok1, mason = pcall(require, "mason")
if not ok1 then
  return
end

local ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok2 then
  return
end

-- servers to have installed with mason
local servers = {
  "cssls",
  "html",
  "tsserver",
  "jsonls",
  "sumneko_lua",
  "volar",
  "svelte",
}

-- mason config
mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- enabling servers in the list with default options + custom options
local ok3, lspconfig = pcall(require, "lspconfig")
if not ok3 then
  return
end

-- on_attach for all!
lspconfig.util.default_config =
  vim.tbl_extend("force", lspconfig.util.default_config, {
    on_attach = require("jedn.lsp.handlers").on_attach,
  })

-- specific setup stuff
for _, server in pairs(servers) do
  local opts = {}

  -- lsp specific settings found in jedn/lsp/settings/*
  if server == "sumneko_lua" then
    opts = require("jedn.lsp.settings.sumneko_lua")
  end

  if server == "tsserver" then
    opts = require("jedn.lsp.settings.tsserver")
  end

  lspconfig[server].setup(opts)
end
