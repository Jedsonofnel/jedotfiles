return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

      ['"'] = {
        action = "closeopen",
        pair = '""',
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
      ["'"] = {
        action = "closeopen",
        pair = "''",
        neigh_pattern = "[^%a\\].",
        register = { cr = false },
      },
      ["`"] = {
        action = "closeopen",
        pair = "``",
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
    },
  },
  config = function(_, opts)
    require("mini.pairs").setup(opts)
  end,
}
