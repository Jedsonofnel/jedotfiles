return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
        config = true,
      },
      {
        "folke/neodev.nvim",
        opts = {
          experimental = {
            pathStrict = true,
          },
        },
      },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_textt = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      autoformat = true,
      -- lsp servers list for installation + options
      servers = {
        jsonls = {},
        html = {},
        cssls = {},
        rust_analyzer = {},
        pyright = {},
        svelte = {},
        tsserver = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        -- additional lsp servers
      },
      -- additional lsp server setup here
      -- return true if you don't want the server to be setup with lspconfig
      setup = {
        -- eg:
        -- tsserver = function(_, opts)
        --   require("typescript").setup({server = opts })
        --   return true
        -- end,
        -- Specify * to use this as fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
    config = function(_, opts)
      -- autoformat
      require("jedn.plugins.lsp.format").autoformat = opts.autoformat
      -- setup formatting and keymaps
      require("jedn.utils").on_attach(function(client, buffer)
        require("jedn.plugins.lsp.format").on_attach(client, buffer)
        require("jedn.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      vim.diagnostic.config(opts.diagnostics)

      -- lsp server
      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      -- this is for manual setting up,
      -- but is also passed to mason-lspconfig for auto setup
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        -- if server has additional lsp setup then it will be run
        -- if it returns true it will not be setup with lspconfig
        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end

        require("lspconfig")[server].setup(server_opts)
      end

      -- fix for lspconfig rename
      local mappings = require("mason-lspconfig.mappings.server")
      if not mappings.lspconfig_to_package.lua_ls then
        mappings.lsp_config_to_package.lua_ls = "lua-language-server"
        mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
      end

      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()

      local ensure_installed = {}

      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this cannot be installed
          -- with mason-lspconfig
          if
            server_opts.mason == false
            or not vim.tbl_contains(available, server)
          then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup_handlers({ setup })
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(
          ".null-ls-root",
          ".neoconf.json",
          "Makefile",
          ".git"
        ),
        sources = {
          -- fish?
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,

          -- lua
          nls.builtins.formatting.stylua,

          -- python
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.pylint,

          -- js
          nls.builtins.code_actions.eslint_d,
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.formatting.prettierd,

          -- rust
          nls.builtins.formatting.rustfmt,
        },
      }
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "pylint",
        "stylua",
        "prettierd",
        "eslint_d",
        "black",
        "flake8",
        "rustfmt",
      },
    },

    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}
