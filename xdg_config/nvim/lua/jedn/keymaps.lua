-- remaps using utility function defined in util.lua

local ok, utils = pcall(require, "jedn.utils")
if not ok then
  return
end

local ok2, wk = pcall(require, "which-key")
if not ok2 then
  return
end

local nnoremap = utils.nnoremap
local vnoremap = utils.nnoremap
local tnoremap = utils.tnoremap

-- basic stuff that don't need to be which-keyed
-- for wraps
nnoremap("j", "gj")
nnoremap("k", "gk")
vnoremap("j", "gj")
vnoremap("k", "gk")

-- terminal stuff
tnoremap("<Esc>", "<c-\\><c-n>")

-- do not yank with x
nnoremap("x", '"_x')

-- which-key stuff
wk.register({
  f = {
    v = { "<cmd>Ex<CR>", "Open Netrw" },
  },
  w = {
    j = { "<c-w>j", "Window Below" },
    k = { "<c-w>k", "Window Above" },
    h = { "<c-w>h", "Window to the Left" },
    l = { "<c-w>l", "Window to the Right" },
    p = { "<c-w>p", "Previous Window" },
    v = { "<cmd>vsplit<CR>", "Vertical Split" },
    s = { "<cmd>split<CR>", "Horizontal Split" },
    q = { "<cmd>close<CR>", "Close Window" },
  },
  b = {
    ["]"] = { "<cmd>bn<CR>", "Next Buffer" },
    ["["] = { "<cmd>bp<CR>", "Previous Buffer" },
    d = { "<cmd>bd<CR>", "Close Buffer" },
  },
  t = {
    n = { "<cmd>tabnew<CR>", "New Tab" },
    ["]"] = { "<cmd>tabN<CR>", "Next Tab" },
    ["["] = { "<cmd>tabp<CR>", "Previous Tab" },
    d = { "<cmd>tabclose<CR>", "Close Tab" },
  },
  s = {
    c = { "<cmd>nohl<CR>", "Clear Search" },
  },
}, { prefix = "<leader>" })
