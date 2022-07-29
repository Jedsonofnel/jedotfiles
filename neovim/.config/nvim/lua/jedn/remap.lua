-- remaps using utility function defined in util.lua

local nnoremap = require("jedn.utils").nnoremap
local tnoremap = require("jedn.utils").tnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- terminal stuff
nnoremap("<leader>t", "<cmd>term<CR>")
tnoremap("<Esc>", "<c-\\><c-n>")
