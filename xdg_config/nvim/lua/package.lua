-- [nfnl] fnl/package.fnl
local function clean()
  local installed = vim.pack.get()
  local unused = {}
  for _, plugin in ipairs(installed) do
    if not plugin.active then
      table.insert(unused, plugin.spec.name)
    else
    end
  end
  if (#unused == 0) then
    return print("No unused plugins.")
  else
    local msg = ("Remove unused plugins?\n" .. table.concat(unused, "\n"))
    if (vim.fn.confirm(msg, "&Yes\n&No", 2) == 1) then
      return vim.pack.del(unused)
    else
      return nil
    end
  end
end
vim.cmd("redraw")
clean()
vim.fn.setqflist()
return {clean = clean}
