return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    -- disables for markdown
    enabled = function()
      return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
    end,

    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
  },
}
