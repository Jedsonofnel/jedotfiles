return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = false },
      ensure_installed = "all",
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      local parser_config =
        require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.context = {
        install_info = {
          url = "https://github.com/pmazaitis/tree-sitter-context",
          files = { "src/parser.c" },
        },
        filetype = "context",
      }
    end,
  },
}
