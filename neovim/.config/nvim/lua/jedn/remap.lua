-- remaps using utility function defined in util.lua

local nnoremap = require("jedn.utils").nnoremap
local tnoremap = require("jedn.utils").tnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- terminal stuff
tnoremap("<Esc>", "<c-\\><c-n>")
