-- telescope config

local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--hidden",
      "--color-never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
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
})

-- for blazingly fast sorting!
require("telescope").load_extension("fzf")

-- project integration
require("telescope").load_extension("projects")

-- keybinds

local nnoremap = require("jedn.utils").nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader><leader>", function()
  builtin.find_files({
    find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
  })
end)

nnoremap("<leader>ff", function()
  builtin.find_files({
    find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
  })
end)

nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fp", "<cmd>Telescope projects<cr>")

local function lsp_references()
  require("telescope.builtin").lsp_references({
    ignore_filename = false,
  })
end

nnoremap("<leader>flr", lsp_references)
