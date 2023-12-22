return {
  "nvim-tree/nvim-tree.lua",
  depencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      width = 35,
      number = false,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          folder = {},
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
    {
      "<leader>ef",
      "<cmd>NvimTreeFindFileToggle<CR>",
      desc = "Toggle file explorer on current file",
    },
    {
      "<leader>ec",
      "<cmd>NvimTreeCollapse<CR>",
      desc = "Collapse file explorer",
    },
    {
      "<leader>er",
      "<cmd>NvimTreeRefresh<CR>",
      desc = "Refresh file explorer",
    },
  },
}
