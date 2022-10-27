-- using mason to install servers
-- as opposed to just manually downloading them urgh

local status, mason = pcall(require, "mason")
if not status then
  return
end

local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  return
end

-- mason config
mason.setup()

mason_lspconfig.setup({
  automatic_installation = true,
})
