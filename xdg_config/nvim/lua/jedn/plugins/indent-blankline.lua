return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      enabled = true,

      -- check :help ibl.config.indent for options
      indent = {
        char = "▏",
      },

      exclude = {
        filetypes = {
          "netrw",
          "lspinfo",
          "lazy",
          "alpha",
          "neo-tree",
          "checkhealth",
          "dashboard",
          "help",
          "man",
          "",
          "mason",
          "trouble",
          "TelescopePrompt",
          "TelescopeResults",
          "packer",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },

      scope = { enabled = false },
    },
  },
}
