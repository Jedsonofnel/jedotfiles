-- CODING RELATED PLUGINS --

return {
  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- svelte plugin
  {
    "leafOftree/vim-svelte-plugin",
  },
}
