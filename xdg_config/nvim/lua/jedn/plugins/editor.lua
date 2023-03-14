-- EDITOR RELATED PLUGINS
-- ie for moving around files and stuff
local utils = require("jedn.utils")

return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("projects")
      require("telescope").load_extension("fzf")
    end,
  },

  -- which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },

    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
      }

      if utils.has("noice.nvim") then
        keymaps["<leader>sn"] = { name = "+noice" }
      end
      wk.register(keymaps)
    end,
  },

  -- neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.loop.cwd(),
          })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
    },

    deactivate = function()
      vim.cmd([[Neotree close]])
    end,

    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,

    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },
}
