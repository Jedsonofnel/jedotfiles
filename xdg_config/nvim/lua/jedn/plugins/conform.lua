return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        svelte = { "biome" },
        css = { "biome" },
        html = { "biome" },
        json = { "biome" },
        yaml = { "yamlfmt" },
        markdown = { "biome" },
        graphql = { "biome" },

        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format" },
        go = { "gofmt" },
        eruby = { "erb_format" },
        ruby = { "rubocop" },
      },

      format_on_save = {
        lsp_fallback = false,
        async = false,
        timeout_ms = 1000,
        quiet = true,
      },
    })
  end,
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          lsp_fallback = false,
          async = false,
          timeout_ms = 500,
          quiet = true,
        })
      end,
      { "n", "v" },
      desc = "Format Code",
    },
  },
}
