return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    options = {
      mode = "tabs",
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Nvim-Tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    {
      "<leader>bP",
      "<Cmd>BufferLineGroupClose ungrouped<CR>",
      desc = "Delete non-pinned buffers",
    },
  },
}
