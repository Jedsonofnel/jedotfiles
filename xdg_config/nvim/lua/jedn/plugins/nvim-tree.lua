return {
  "nvim-tree/nvim-tree.lua",
  depencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      width = 35,
      relativenumber = true,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "", -- arrow when folder is closed
            arrow_open = "", -- arrow when folder is open
          },
        },
      },
    },
    -- disable window_picker for explorer to work well with splits
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      custom = { ".DS_Store" },
    },
    git = {
      enable = false,
    },
  },
  config = function(_, opts)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup(opts)
  end,
  keys = {
    {
      "<leader>ee",
      "<cmd>NvimTreeToggle<CR>",
      desc = "Toggle file explorer",
    },
  },
}
