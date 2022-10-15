-- options!

vim.g.loaded_matchparen = 1

local opt = vim.opt

-- highlights
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- basic stuff
opt.fileencoding = "utf-8"
opt.title = true
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.incsearch = true -- makes search better ...?
opt.showmatch = false -- show matching bracket
opt.relativenumber = true -- show rel numbers
opt.number = true -- show actual number as well
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- unless capital is used
opt.hidden = true -- buffers stay when hidden
opt.equalalways = false
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 1000
opt.hlsearch = false
opt.scrolloff = 8
opt.signcolumn = "yes" -- always show signcolumn

-- only have it in the active buffer
-- copied from: https://github.com/tjdevries/config_manager/
opt.cursorline = true
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
-- when event, show cursor?
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-- tabs!
opt.autoindent = true
opt.cindent = true -- indenting rules based on C, not really sure...
opt.wrap = true

opt.tabstop = 4 -- number of whitespace for \t char
opt.shiftwidth = 4 -- width of indentation
opt.softtabstop = 4 -- number of space added by pressing tab button
opt.expandtab = true -- \t -> whitespace

opt.breakindent = true -- wrapped lines will indent!
opt.showbreak = string.rep(" ", 3) -- wrapped lines will have this appended to
opt.linebreak = true -- wraps at word not character

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = "all"

-- clipboard
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })

opt.inccommand = "split" -- todo with cmd previews
opt.swapfile = false
opt.undofile = true -- save undo history!

-- shared data
-- ! = save and restore global variables
-- ' = max number of marked files remembered
-- < = max number of lines saved for each register
-- s = max size of item's content in KiB
opt.shada = { "!", "'1000", "<50", "s10" }

opt.mouse = "n"

opt.formatoptions = opt.formatoptions
  - "a" -- autoformatting of paragraphs NO
  - "t" -- autowrap using textwidth NO
  + "c" -- autowrap comments
  + "q" -- allow formatting of comments with "gq"
  - "o" -- automatically insert comment leader after "o" NO
  + "r" -- automatically continue comment with <enter> tho
  + "n" -- formats numbered lists with good indentation
  + "j" -- auto-remove comments when joining lines
  - "2" -- uses 2nd line of paragraph for indentation!?!?

opt.joinspaces = false -- this option makes a . insert two spaces

opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "hiddenoff",
  "algorithm:minimal",
}
