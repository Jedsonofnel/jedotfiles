-- null ls config for getting formatters to work well

local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    diagnostics.eslint_d.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    }),
    formatting.prettierd.with({
      extra_filetypes = { "svelte", "json" },
    }),
    formatting.black,
  },
})
