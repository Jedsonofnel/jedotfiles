-- all my lsp stuff:

-- mason file installs and sets up all the lsp servers using
-- mason.nvim
require("jedn.lsp.mason")

require("jedn.lsp.handlers").setup()
