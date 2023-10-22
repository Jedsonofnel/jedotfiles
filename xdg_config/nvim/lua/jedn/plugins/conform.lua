return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },

        lua = { "stylua" },
        python = { "black", "isort" },
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
          lsp_fallback = true,
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
