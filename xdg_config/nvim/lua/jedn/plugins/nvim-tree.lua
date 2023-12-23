return {
  "nvim-tree/nvim-tree.lua",
  depencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },

  opts = {
    filters = {
      dotfiles = false,
      custom = { ".DS_Store" },
    },

    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = false,

    update_focused_file = {
      enable = true,
      update_root = false,
    },

    view = {
      adaptive_size = false,
      side = "left",
      width = 30,
      preserve_window_proportions = true,
    },

    git = {
      enable = false,
      ignore = true,
    },

    filesystem_watchers = {
      enable = true,
    },

    -- disable window_picker for explorer to work well with splits
    actions = {
      open_file = {
        resize_window = true,
        window_picker = {
          enable = false,
        },
      },
    },

    renderer = {
      root_folder_label = false,
      highlight_git = false,
      highlight_opened_files = "none",

      indent_markers = {
        enable = false,
      },

      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },

        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
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
