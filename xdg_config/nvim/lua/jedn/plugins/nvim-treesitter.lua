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
      ensure_installed = {
        "arduino",
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "desktop",
        "diff",
        "dockerfile",
        "editorconfig",
        "fish",
        "gdscript",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "matlab",
        "nginx",
        "nix",
        "python",
        "ruby",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "svelte",
        "tmux",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
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
