local ok, treesitter_context = pcall(require, "treesitter-context")
if not ok then
  return
end

treesitter_context.setup({
  enable = true,
  max_lines = 1,
  trim_scope = "outer",

  patterns = {
    default = {
      "class",
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
    json = {
      "pair",
    },
  },
})

local nnoremap = require("jedn.utils").nnoremap
nnoremap("<leader>tc", "<cmd>TSContextToggle<CR>")
