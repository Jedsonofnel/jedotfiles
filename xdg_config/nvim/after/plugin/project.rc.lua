-- project config

local status, project = pcall(require, "project_nvim")
if not status then
  return
end

project.setup({
  detection_methods = { "pattern" },
  show_hidden = false,
})
