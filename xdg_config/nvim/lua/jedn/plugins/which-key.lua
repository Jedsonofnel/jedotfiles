return {
  {
    "folke/which-key.nvim",
    dependencies = {
      "echasnovski/mini.icons",
    },
    event = "VeryLazy",
    opts = {
      plugins = {
        presets = {
          operators = true,
          motions = true,
        },
      },
    },

    config = function(_, opts)
      local wk = require("which-key")
      wk.add({
        { "<leader>b", group = "+buffers" },
        { "<leader>c", group = "+code" },
        { "<leader>e", group = "+explorer" },
        { "<leader>f", group = "+file/find" },
        { "<leader>g", group = "+goto" },
        { "<leader>l", group = "+lsp" },
        { "<leader>p", group = "+misc" },
        { "<leader>pv", "<cmd>Ex<CR>", desc = "Open Netrw", mode = "n" },
        { "<leader>s", group = "+search" },
        { "<leader>sc", "<cmd>nohl<CR>", desc = "Clear Search", mode = "n" },
        { "<leader>t", group = "+tabs" },
        { "<leader>w", group = "+windows" },
      })
      wk.setup(opts)
    end,
  },
}
