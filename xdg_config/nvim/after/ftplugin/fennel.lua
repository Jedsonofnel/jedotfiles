-- [nfnl] after/ftplugin/fennel.fnl
vim.opt.tabstop = 2
local _local_1_ = require("nvim-paredit")
local api = _local_1_.api
local opts = {buffer = true, silent = true}
for key, fn_2a in pairs({["<M-w>"] = api.move_to_next_element_head, ["<M-b>"] = api.move_to_prev_element_head, ["<M-e>"] = api.move_to_next_element_tail, ["<M-u>"] = api.move_to_parent_form_start, ["<M-U>"] = api.move_to_parent_form_end}) do
  vim.keymap.set({"n", "i", "x", "v"}, key, fn_2a, opts)
end
vim.keymap.set("n", "<M-l>", api.drag_element_forwards, vim.tbl_extend("force", opts, {desc = "Drag element right"}))
vim.keymap.set("n", "<M-h>", api.drag_element_backwards, vim.tbl_extend("force", opts, {desc = "Drag element left"}))
vim.keymap.set("n", "<M-k>", api.drag_form_forwards, vim.tbl_extend("force", opts, {desc = "Drag form right"}))
return vim.keymap.set("n", "<M-j>", api.drag_form_backwards, vim.tbl_extend("force", opts, {desc = "Drag form left"}))
