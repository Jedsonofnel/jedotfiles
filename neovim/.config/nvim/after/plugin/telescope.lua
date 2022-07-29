-- telescope config

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--hidden',
            '--color-never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

-- for blazingly fast sorting!
require('telescope').load_extension('fzf')

-- project integration
require('telescope').load_extension('projects')

-- keybinds

local nnoremap = require('jedn.utils').nnoremap

nnoremap("<leader>ff", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
nnoremap("<leader> ", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fp", "<cmd>Telescope projects<cr>")
