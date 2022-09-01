-- null ls config for getting formatters to work well

local ok1, null_ls = pcall(require, "null-ls")
if not ok1 then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettierd.with({
      extra_filetypes = { "svelte", "json" },
    }),
    formatting.stylua,
    diagnostics.eslint_d,
  },
})
