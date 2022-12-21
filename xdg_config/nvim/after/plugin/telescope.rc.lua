-- telescope config
local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
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
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
    },
  },
})

-- for blazingly fast sorting!
telescope.load_extension("fzf")

-- project integration
telescope.load_extension("projects")

-- keybinds

local nnoremap = require("jedn.utils").nnoremap
local builtin = require("telescope.builtin")

nnoremap("<leader><leader>", builtin.find_files)
nnoremap("<leader>pf", builtin.find_files)
nnoremap("<C-p>", builtin.git_files)

nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fp", "<cmd>Telescope projects<cr>")
