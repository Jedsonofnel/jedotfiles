-- remaps using utility function defined in util.lua

local ok, utils = pcall(require, "jedn.utils")
if not ok then
  return
end

local nnoremap = utils.nnoremap
local vnoremap = utils.nnoremap
local tnoremap = utils.tnoremap

-- netrw
nnoremap("<leader>fv", "<cmd>Ex<CR>")

-- for wraps
nnoremap("j", "gj")
nnoremap("k", "gk")
vnoremap("j", "gj")
vnoremap("k", "gk")

-- do not yank with x
nnoremap("x", '"_x')

-- window navigation (ok to be used in terminals as well)
nnoremap("<leader>wj", "<c-w>j")
nnoremap("<leader>wl", "<c-w>l")
nnoremap("<leader>wk", "<c-w>k")
nnoremap("<leader>wh", "<c-w>h")

-- go to last window:
nnoremap("<leader>wp", "<c-w>p")

nnoremap("<leader>wv", "<cmd>vsplit<CR>")
nnoremap("<leader>ws", "<cmd>split<CR>")
nnoremap("<leader>wq", "<cmd>close<CR>")

-- buffer nav
nnoremap("<leader>b]", "<cmd>bn<CR>")
nnoremap("<leader>b[", "<cmd>bp<CR>")
nnoremap("<leader>bd", "<cmd>bd<CR>")

-- tab nav
nnoremap("<leader>tn", "<cmd>tabnew<CR>")
nnoremap("<leader>t]", "<cmd>tabN<CR>")
nnoremap("<leader>t[", "<cmd>tabp<CR>")
nnoremap("<leader>td", "<cmd>tabc<CR>")

-- terminal stuff
tnoremap("<Esc>", "<c-\\><c-n>")

-- search clear
nnoremap("<leader>sc", "<cmd>nohl<CR>")
