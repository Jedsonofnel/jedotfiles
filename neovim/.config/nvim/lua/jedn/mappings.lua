-- remaps using utility function defined in util.lua

local nnoremap = require("jedn.utils").nnoremap
local tnoremap = require("jedn.utils").tnoremap
local lsp_formatting = require("jedn.lsp.handlers").lsp_formatting

-- netrw
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- window navigation (ok to be used in terminals as well)
nnoremap("<leader>wj", "<c-w>j")
nnoremap("<leader>wl", "<c-w>l")
nnoremap("<leader>wk", "<c-w>k")
nnoremap("<leader>wh", "<c-w>h")

nnoremap("<leader>wv", "<cmd>vsplit<CR>")
nnoremap("<leader>ws", "<cmd>split<CR>")
nnoremap("<leader>wq", "<cmd>close<CR>")

-- terminal stuff
tnoremap("<Esc>", "<c-\\><c-n>")
