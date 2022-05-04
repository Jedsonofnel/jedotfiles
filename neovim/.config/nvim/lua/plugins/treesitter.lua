--
-- jedn nvim config
-- treesitter plugin settings
--

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  ensure_installed = {
    'bash',
    'css',
    'html',
    'javascript',
    'json',
    'lua',
    'python',
    'scss',
    'typescript',
    'ruby',
    'go',
    'svelte',
  },
  playground = {
    enable = true,
  },
}
