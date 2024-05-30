-- options!

vim.cmd("let g:netrw_liststyle = 3")
vim.cmd("let g:netrw_banner = 0")

local opt = vim.opt

-- misc
opt.autowrite = true -- Enable auto write (write when move buffer)
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.grepprg = "rg --vimgrep" -- Use ripgrep I bet
opt.spelllang = { "en" }
opt.timeoutlen = 300

-- split stuff
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

-- ui
opt.termguicolors = true -- True color support
opt.cursorline = true -- Enable highlighting of the current line
opt.laststatus = 2 -- number of lines at bottom including status
opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.background = "dark"

-- column stuff
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers

-- anything to do with tab width/indentation
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- copy from current line

-- search settings
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals

-- undo stuff
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- wrap stuff
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- saw in a video
opt.backspace = "indent,eol,start"

-- :help listchars
opt.list = false -- enable them
opt.listchars:append({
  space = "•",
  tab = "▏•",
})
