return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("gruvbox").setup(opts)
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",

    opts = {
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        bufferline = true,
      },
      custom_highlights = function(colors)
        return {
          IblIndent = { fg = colors.surface0 },
          netrwTreeBar = { fg = colors.surface1 },
        }
      end,
    },

    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
  {
    "marko-cerovac/material.nvim",
    opts = {
      contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = true, -- Enable darker background for the cursor line
        lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
        non_current_windows = false, -- Enable contrasted background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
      },
      styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        strings = { bold = true },
        keywords = { -- [[underline=true]]
        },
        functions = { --[[ bold = true, undercurl = true ]]
        },
        variables = {},
        operators = {},
        types = {},
      },
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        -- "fidget",
        -- "flash",
        -- "gitsigns",
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        "indent-blankline",
        -- "lspsaga",
        "mini",
        -- "neogit",
        -- "neotest",
        -- "neo-tree",
        -- "neorg",
        -- "noice",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "rainbow-delimiters",
        -- "sneak",
        "telescope",
        -- "trouble",
        "which-key",
        -- "nvim-notify",
      },
      disable = {
        colored_cursor = true, -- Disable the colored cursor
        borders = false, -- Disable borders between vertically split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },
      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
      },
      lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
      async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)
      custom_colors = nil, -- If you want to override the default colors, set this to a function
      custom_highlights = {}, -- Overwrite highlights with your own
    },
    config = function(_, opts)
      require("material").setup(opts)
    end,
  },
  { "EdenEast/nightfox.nvim" },
}
