-- [nfnl] after/plugin/paredit.fnl
local paredit = require("nvim-paredit")
local api = paredit.api
local function wrap_parent(l_delim, r_delim)
  local function _1_()
    return api.wrap_enclosing_form_under_cursor({opener = l_delim, closer = r_delim})
  end
  return _1_
end
local function wrap_elem(l_delim, r_delim)
  local function _2_()
    return api.wrap_enclosing_form_under_cursor({opener = l_delim, closer = r_delim})
  end
  return _2_
end
local keys
local function _3_()
  api.move_to_parent_form_start()
  return vim.api.nvim_feedkeys("a", "n", false)
end
local function _4_()
  api.move_to_parent_form_end()
  return vim.cmd("startinsert")
end
keys = {["<localleader>i"] = {wrap_parent("(", ")"), "Wrap form with ()"}, ["<localleader>["] = {wrap_parent("[", "]"), "Wrap form with []"}, ["<localleader>{"] = {wrap_parent("{", "}"), "Wrap form with {}"}, ["<localleader>w"] = {wrap_elem("(", ")"), "Wrap element with ()"}, ["<localleader>e["] = {wrap_elem("[", "]"), "Wrap element with []"}, ["<localleader>e{"] = {wrap_elem("{", "}"), "Wrap element with {}"}, ["<M-l>"] = {api.drag_element_forwards, "Drag element right"}, ["<M-h>"] = {api.drag_element_backwards, "Drag element left"}, ["<M-k>"] = {api.drag_form_forwards, "Drag form right"}, ["<M-j>"] = {api.drag_form_backwards, "Drag form left"}, ["<M-S-l>"] = {api.slurp_forwards, "Slurp forwards"}, ["<M-S-h>"] = {api.barf_forwards, "Barf forwards"}, ["<M-S-k>"] = {api.slurp_backwards, "Slurp backwards"}, ["<M-S-j>"] = {api.barf_backwards, "Barf backwards"}, ["<localleader>^"] = {_3_, "Insert at form head"}, ["<localleader>$"] = {_4_, "Insert at form tail"}}
return paredit.setup({use_default_keys = true, keys = keys})
