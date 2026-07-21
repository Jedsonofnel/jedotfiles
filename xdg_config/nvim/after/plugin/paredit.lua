-- [nfnl] after/plugin/paredit.fnl
local paredit = require("nvim-paredit")
local keys
local function _1_()
  return paredit.api.wrap_enclosing_form_under_cursor({opener = "(", closer = ")"})
end
local function _2_()
  return paredit.api.wrap_enclosing_form_under_cursor({opener = "[", closer = "]"})
end
local function _3_()
  return paredit.api.wrap_enclosing_form_under_cursor({opener = "{", closer = "}"})
end
local function _4_()
  return paredit.api.wrap_element_under_cursor({opener = "(", closer = ")"})
end
local function _5_()
  return paredit.api.wrap_element_under_cursor({opener = "[", closer = "]"})
end
local function _6_()
  return paredit.api.wrap_element_under_cursor({opener = "{", closer = "}"})
end
local function _7_()
  paredit.api.move_to_parent_form_start()
  return vim.api.nvim_feedkeys("a", "n", false)
end
local function _8_()
  paredit.api.move_to_parent_form_end()
  return vim.cmd("startinsert")
end
keys = {["<localleader>i"] = {_1_, "Wrap form with ()"}, ["<localleader>["] = {_2_, "Wrap form with []"}, ["<localleader>{"] = {_3_, "Wrap form with {}"}, ["<localleader>w"] = {_4_, "Wrap element with ()"}, ["<localleader>e["] = {_5_, "Wrap element with []"}, ["<localleader>e{"] = {_6_, "Wrap element with {}"}, ["<M-l>"] = {paredit.api.drag_element_forwards, "Drag element right"}, ["<M-h>"] = {paredit.api.drag_element_backwards, "Drag element left"}, ["<M-k>"] = {paredit.api.drag_form_forwards, "Drag form right"}, ["<M-j>"] = {paredit.api.drag_form_backwards, "Drag form left"}, ["<M-S-l>"] = {paredit.api.slurp_forwards, "Slurp forwards"}, ["<M-S-h>"] = {paredit.api.barf_forwards, "Barf forwards"}, ["<M-S-k>"] = {paredit.api.slurp_backwards, "Slurp backwards"}, ["<M-S-j>"] = {paredit.api.barf_backwards, "Barf backwards"}, ["<localleader>^"] = {_7_, "Insert at form head"}, ["<localleader>$"] = {_8_, "Insert at form tail"}}
return paredit.setup({use_default_keys = true, keys = keys})
