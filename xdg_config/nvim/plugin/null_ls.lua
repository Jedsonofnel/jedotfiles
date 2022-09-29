-- null ls config for getting formatters to work well

local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})"
    }),
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = { "svelte", "json" },
    }),
    -- null_ls.builtins.formatting.stylua,
  },
})
