return {
  {
    "folke/which-key.nvim",
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
      wk.setup(opts)

      local keymaps = {
        ["g"] = { name = "+goto" },
        ["<leader>b"] = {
          name = "+buffer",
          ["]"] = { "<cmd>bn<CR>", "Next Buffer" },
          ["["] = { "<cmd>bp<CR>", "Previous Buffer" },
          d = { "<cmd>bd<CR>", "Close Buffer" },
        },
        ["<leader>c"] = { name = "+code" },
        ["<leader>e"] = { name = "+explorer" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>p"] = {
          name = "+misc",
          v = { "<cmd>Ex<CR>", "Open Netrw" },
        },
        ["<leader>s"] = {
          name = "+search",
          c = { "<cmd>nohl<CR>", "Clear Search" },
        },
        ["<leader>t"] = {
          name = "+tabs",
          n = { "<cmd>tabnew<CR>", "New Tab" },
          ["]"] = { "<cmd>tabN<CR>", "Next Tab" },
          ["["] = { "<cmd>tabp<CR>", "Previous Tab" },
          d = { "<cmd>tabclose<CR>", "Close Tab" },
        },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = {
          name = "+windows",
          j = { "<c-w>j", "Window Below" },
          k = { "<c-w>k", "Window Above" },
          h = { "<c-w>h", "Window to the Left" },
          l = { "<c-w>l", "Window to the Right" },
          p = { "<c-w>p", "Previous Window" },
          v = { "<cmd>vsplit<CR>", "Vertical Split" },
          s = { "<cmd>split<CR>", "Horizontal Split" },
          q = { "<cmd>close<CR>", "Close Window" },
        },
      }

      wk.register(keymaps)
    end,
  },
}
