return {
  "tpope/vim-rails",
  ft = { "ruby", "eruby" },
  dependencies = {
    "tpope/vim-bundler",
    "tpope/vim-rake",
  },
  config = function()
    vim.keymap.set("n", "<leader>ra", ":Rails<CR>", { desc = "Rails Command" })
  end,
}
