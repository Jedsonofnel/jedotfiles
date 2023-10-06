return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      show_hidden = true,
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
}
