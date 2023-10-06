return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      show_hidden = true,
      patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        "stylua.toml",
      },
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
}
