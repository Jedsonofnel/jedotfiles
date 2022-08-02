-- using mason to install servers
-- as opposed to just manually downloading them urgh

local ok1, mason = pcall(require, "mason")
if not ok1 then
    return
end

local ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok2 then
    return
end

-- servers to have installed with mason
local servers = {
    "sumneko_lua",
}

-- mason config
mason.setup {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        }
    }
}

mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

-- enabling servers in the list with default options + custom options
local ok3, lspconfig = pcall(require, "lspconfig")
if not ok3 then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("jedn.lsp.handlers").on_attach,
        capabilities = require("jedn.lsp.handlers").capabilities,
    }

    -- lsp specific settings found in jedn/lsp/settings/*
    if server == "sumneko_lua" then
        local sumneko_opts = require("jedn.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    lspconfig[server].setup(opts)
end
