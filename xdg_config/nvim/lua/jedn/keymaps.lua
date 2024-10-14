-- remaps using utility function defined in util.lua

local ok, utils = pcall(require, "jedn.utils")
if not ok then
  return
end

local nnoremap = utils.nnoremap
local vnoremap = utils.nnoremap
local tnoremap = utils.tnoremap

-- for wraps
nnoremap("j", "gj")
nnoremap("k", "gk")
vnoremap("j", "gj")
vnoremap("k", "gk")

-- window
nnoremap("<leader>wj", "<c-w>j", { desc = "Window Below" })
nnoremap("<leader>wk", "<c-w>k", { desc = "Window Above" })
nnoremap("<leader>wh", "<c-w>h", { desc = "Window to the Left" })
nnoremap("<leader>wl", "<c-w>l", { desc = "Window to the Right" })
nnoremap("<leader>wp", "<c-w>p", { desc = "Previous Window" })
nnoremap("<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
nnoremap("<leader>ws", "<cmd>split<CR>", { desc = "Horizontal Split" })
nnoremap("<leader>wq", "<cmd>close<CR>", { desc = "Close Window" })
nnoremap("<leader>w=", "<c-w>=", { desc = "Equalise Windows" })

-- tabs
nnoremap("<leader>tn", "<cmd>tabnew<CR>", { desc = "New Tab" })
nnoremap("<leader>t]", "<cmd>tabNext<CR>", { desc = "Next Tab" })
nnoremap("<leader>t[", "<cmd>tabprevious<CR>", { desc = "Previous Tab" })
nnoremap("<leader>td", "<cmd>tabclose<CR>", { desc = "Close Tab" })
nnoremap("<leader>t1", "<cmd>1tabnext<CR>", { desc = "Go to Tab 1" })
nnoremap("<leader>t2", "<cmd>2tabnext<CR>", { desc = "Go to Tab 2" })
nnoremap("<leader>t3", "<cmd>3tabnext<CR>", { desc = "Go to Tab 3" })
nnoremap("<leader>t4", "<cmd>4tabnext<CR>", { desc = "Go to Tab 4" })

-- buffers
nnoremap("<leader>b]", "<cmd>BufferNext<CR>", { desc = "Next Buffer" })
nnoremap("<leader>b[", "<cmd>BufferPrevious<CR>", { desc = "Previous Buffer" })
nnoremap("<leader>bd", "<cmd>BufferClose<CR>", { desc = "Close Buffer" })

-- terminal stuff
tnoremap("<Esc>", "<c-\\><c-n>")

-- do not yank with x
nnoremap("x", '"_x')

-- zenmode
nnoremap("<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle zen mode" })
