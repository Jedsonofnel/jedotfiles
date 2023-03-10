return {
  "nvim-lualine/lualine.nvim",

  depencies = {
    "kyazdani42/nvim-web-devicons",
  },

  config = {
    options = {
      icons_enabled = true,
      disabled_filetypes = {},
      theme = "tokyonight",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "filename",
          file_status = true,
          path = 0, -- 0 = just filename, 1 = relative path, 2 = abs path
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
        "encoding",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          file_status = true,
          path = 1, -- 1 = relative path
        },
      },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "fugitive" },
  },
}
