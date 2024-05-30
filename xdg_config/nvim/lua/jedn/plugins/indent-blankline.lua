return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      -- check :help ibl.config.indent for options
      indent = {
        char = "▏",
      },
      scope = { enabled = false },
    },
  },
}
