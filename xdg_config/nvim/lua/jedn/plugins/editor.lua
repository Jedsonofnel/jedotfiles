-- EDITOR RELATED PLUGINS
-- ie for moving around files and stuff
local utils = require("jedn.utils")

return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers show_all_buffers=true<cr>",
        desc = "Switch Buffer",
      },
      {
        "<leader>/",
        utils.telescope("live_grep"),
        desc = "Find in Files (Grep)",
      },
      {
        "<leader>:",
        "<cmd>Telescope command history<cr>",
        desc = "Command history",
      },
      {
        "<leader><space>",
        utils.telescope("files"),
        desc = "Find files (root dir)",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Buffers",
      },
      {
        "<leader>ff",
        utils.telescope("files"),
        desc = "Find files (root dir)",
      },
      {
        "<leader>ff",
        utils.telescope("files", { cwd = false }),
        desc = "Find files (cwd)",
      },
      {
        "<leader>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent",
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
    },
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
        ["c"] = { name = "+code" },
        ["f"] = { name = "+file/find" },
        ["u"] = { name = "+ui" },
        ["w"] = { name = "+windows" },
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
            dir = require("jedn.utils").get_root(),
          })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            dir = vim.loop.cwd(),
          })
        end,
        desc = "Explorer NeoTree (cwd)",
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
        bind_to_cwd = false,
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
