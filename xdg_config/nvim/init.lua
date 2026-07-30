-- [nfnl] init.fnl
local function setopt(optname, val)
  vim.opt[optname] = val
  return nil
end
local function setkmap(modestr, key, mapping)
  return vim.keymap.set(modestr, key, mapping)
end
local function setkmap_n(key, mapping)
  return setkmap("n", key, mapping)
end
local function codeberg(name)
  return {src = ("https://codeberg.org/" .. name)}
end
local function github(name)
  return {src = ("https://github.com/" .. name)}
end
vim.g.mapleader = " "
vim.g.maplocalleader = ","
setopt("winborder", "single")
setopt("number", true)
setopt("relativenumber", true)
setopt("signcolumn", "yes")
setopt("cursorline", true)
setopt("termguicolors", true)
setopt("wrap", false)
setopt("clipboard", "unnamedplus")
setopt("scrolloff", 8)
setopt("incsearch", true)
setopt("smartcase", true)
setopt("tabstop", 4)
setopt("expandtab", true)
setopt("shiftwidth", 0)
local function _1_()
  return vim.cmd.edit(vim.fn.expand("%:p:h"))
end
setkmap_n("<leader>e", _1_)
setkmap_n("<leader>sc", ":nohl<CR>")
setkmap_n("<leader><leader>", "<c-6>")
vim.pack.add({codeberg("comfysage/artio.nvim"), github("nvim-mini/mini.icons"), github("nvim-mini/mini.base16"), github("stevearc/conform.nvim"), github("neovim/nvim-lspconfig"), github("romus204/tree-sitter-manager.nvim"), github("lukas-reineke/indent-blankline.nvim"), github("windwp/nvim-autopairs"), github("sainnhe/gruvbox-material"), github("julienvincent/nvim-paredit"), github("olical/conjure"), github("olical/nfnl")})
do
  local ui2 = require("vim._core.ui2")
  ui2.enable({enable = true, msg = {target = "msg"}})
end
do
  local artio = require("artio")
  artio.setup({opts = {promptprefix = ">", pointer = ">"}, win = {height = 10}, mappings = {["<down>"] = "down", ["<up>"] = "up", ["<c-n>"] = "up", ["<c-p>"] = "down", ["<cr>"] = "accept", ["<esc>"] = "cancel", ["<tab>"] = "mark", ["<c-g>"] = "togglelive", ["<c-l>"] = "togglepreview", ["<c-q>"] = "setqflist", ["<m-q>"] = "setqflistmark"}})
  vim.ui.select = artio.select
end
setkmap_n("<c-p>", "<Plug>(artio-files)")
setkmap_n("<leader>ff", "<Plug>(artio-smart)")
setkmap_n("<leader>fg", "<Plug>(artio-grep)")
setkmap_n("<leader>fb", "<Plug>(artio-buffers)")
setkmap_n("<leader>fo", "<Plug>(artio-oldfiles)")
vim.lsp.enable({"clangd", "lua_ls", "biome", "gopls", "html", "ruby_lsp", "pyright", "fennel_ls", "zls"})
vim.lsp.config("lua_ls", {root_markers = {".nfnl.fnl", ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", ".git"}, settings = {Lua = {diagnostics = {globals = {"vim"}}, workspace = {library = {vim.env.VIMRUNTIME}, checkThirdParty = false}}}})
setkmap_n("<leader>d", vim.diagnostic.open_float)
setkmap_n("<leader>lr", ":lsp restart<CR>")
local function _2_()
  local conform = require("conform")
  return conform.format({timeout_ms = 1000})
end
setkmap_n("<leader>lf", _2_)
local function _3_(args)
  local client = vim.lsp.get_client_by_id(args.data.clien_id)
  if (client and (client.name == "lua_ls")) then
    client.server_capabilities.semanticTokensProvider = nil
    return nil
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("LspAttach", {callback = _3_})
do
  local conform = require("conform")
  conform.setup({formatters_by_ft = {ruby = {"rubocop"}, eruby = {"erb_format"}, css = {"biome"}, python = {"black"}, c = {"clang_format"}, cpp = {"clang_format"}, lua = {"stylua"}, fennel = {"fnlfmt"}, nix = {"alejandra"}, zig = {"zigfmt"}}})
end
do
  local ts_manager = require("tree-sitter-manager")
  ts_manager.setup({["ensure-installed"] = {"c", "cpp", "lua", "go", "python", "ruby", "fennel", "zig"}, highlight = true})
end
do
  local npairs = require("nvim-autopairs")
  local rule = require("nvim-autopairs.rule")
  local lisp_fts = {"fennel", "clojure", "scheme", "lisp", "janet"}
  npairs.setup({check_ts = true})
  npairs.add_rules({rule("(", ")", lisp_fts), rule("[", "]", lisp_fts), rule("{", "}", lisp_fts)})
end
do
  local hooks = require("ibl.hooks")
  local ibl = require("ibl")
  hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
  ibl.setup({indent = {char = "\226\150\143"}, scope = {enabled = false}, exclude = {filetypes = {"fennel"}}})
end
vim.g["conjure#mapping#doc_word"] = "gk"
local function _5_(ev)
  vim.bo[ev.buf]["buftype"] = "nofile"
  vim.bo[ev.buf]["swapfile"] = false
  vim.bo[ev.buf]["buflisted"] = false
  return nil
end
vim.api.nvim_create_autocmd("BufWinEnter", {pattern = "conjure-log-*", callback = _5_})
do
  local cmd = os.getenv("CONJURE_FENNEL_CMD")
  if cmd then
    vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
    vim.g["conjure#client#fennel#stdio#command"] = cmd
  else
  end
end
vim.g.zig_fmt_autosave = 0
return vim.cmd.colorscheme("gruvbox-material")
