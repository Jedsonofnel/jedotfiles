-- using mason to install servers
-- as opposed to just manually downloading them urgh

local ok, mason = pcall(require, "mason")
if not ok then
  return
end

local ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok2 then
  return
end

-- mason config
mason.setup()

mason_lspconfig.setup({
  automatic_installation = true,
})
