-- [nfnl] after/plugin/paredit.fnl
local paredit = require("nvim-paredit")
local api = paredit.api
local cursor = paredit.cursor
local wrap = paredit.wrap
local closing = {["("] = ")", ["["] = "]", ["{"] = "}"}
local placement_str = {inner_start = "head", inner_end = "tail"}
local function wrap_parent(delim, placement)
  local endelim = closing[delim]
  local placement0 = (placement or "inner_start")
  local function _1_()
    return cursor.place_cursor(wrap.wrap_enclosing_form_under_cursor(delim, endelim), {placement = placement0, mode = "insert"})
  end
  return {_1_, string.format("Wrap form with %s%s, insert %s", delim, endelim, placement_str[placement0])}
end
local function wrap_parent_tail(delim)
  return wrap_parent(delim, "inner_start")
end
local function wrap_elem(delim, placement)
  local endelim = closing[delim]
  local placement0 = (placement or "inner_start")
  local function _2_()
    return cursor.place_cursor(wrap.wrap_element_under_cursor(delim, endelim), {placement = placement0, mode = "insert"})
  end
  return {_2_, string.format("Wrap element with %s%s, insert %s", delim, endelim, placement_str[placement0])}
end
local function wrap_elem_tail(delim)
  return wrap_elem(delim, "inner_end")
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
keys = {["<localleader>i"] = wrap_parent("("), ["<localleader>I"] = wrap_parent_tail("("), ["<localleader>["] = wrap_parent("["), ["<localleader>]"] = wrap_parent_tail("["), ["<localleader>{"] = wrap_parent("{"), ["<localleader>}"] = wrap_parent_tail("{"), ["<localleader>w"] = wrap_elem("("), ["<localleader>W"] = wrap_elem_tail("("), ["<localleader>e["] = wrap_elem("["), ["<localleader>e]"] = wrap_elem_tail("["), ["<localleader>e{"] = wrap_elem("{", "}"), ["<localleader>e}"] = wrap_elem_tail("{"), ["<M-S-l>"] = {api.slurp_forwards, "Slurp forwards"}, ["<M-S-h>"] = {api.barf_forwards, "Barf forwards"}, ["<M-S-k>"] = {api.slurp_backwards, "Slurp backwards"}, ["<M-S-j>"] = {api.barf_backwards, "Barf backwards"}, ["<localleader>^"] = {_3_, "Insert at form head"}, ["<localleader>$"] = {_4_, "Insert at form tail"}}
return paredit.setup({use_default_keys = true, keys = keys})
