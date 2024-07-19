return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers show_all_buffers=true<cr>",
        desc = "Switch Buffer",
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Find in Files (Grep)",
      },
      {
        "<leader>:",
        "<cmd>Telescope command_history<cr>",
        desc = "Command history",
      },
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files (root dir)",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Buffers",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files (root dir)",
      },
      {
        "<leader>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent",
      },
      {
        "<leader>fp",
        function()
          require("telescope").extensions.projects.projects({})
        end,
        desc = "Find projects",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").colorscheme()
        end,
      },
      {
        "<c-p>",
        "<cmd>Telescope git_files<cr>",
        desc = "Git files",
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = function(...)
              return require("telescope.actions").close(...)
            end,
            ["<c-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<c-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
          },
        },
        file_ignore_patterns = {
          "node_modules",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("projects")
      require("telescope").load_extension("fzf")
    end,
  },
}
