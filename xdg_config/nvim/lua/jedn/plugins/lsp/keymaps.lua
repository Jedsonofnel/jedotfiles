local M = {}

M.keys = nil

function M.get()
  local format = require("jedn.plugins.lsp.format").format
  if not M._keys then
    M._keys = {
      { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      {
        "<leader>ca",
        vim.lsp.buf.code_action,
        desc = "Code Action",
        mode = { "n", "v" },
        has = "codeAction",
      },
      {
        "<leader>cf",
        format,
        desc = "Format Document",
        has = "documentFormatting",
      },
      {
        "<leader>cf",
        format,
        desc = "Format Range",
        mode = "v",
        has = "documentRangeFormatting",
      },
      {
        "gd",
        "<cmd>Telescope lsp_definitions<cr>",
        desc = "Goto Definition",
        has = "definition",
      },
    }

    if require("jedn.utils").has("inc-rename.nvim") then
      M._keys[#M._keys + 1] = {
        "<leader>cr",
        function()
          require("inc_rename")
          return ":IncRename" .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename",
        has = "rename",
      }
    else
      M._keys[#M._keys + 1] =
        { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    end
  end
  return M._keys
end

function M.on_attach(client, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = {}

  for _, value in ipairs(M.get()) do
    local keys = Keys.parse(value)
    if keys[2] == vim.NIL or keys[2] == false then
      keymaps[keys.id] = nil
    else
      keymaps[keys.id] = keys
    end
  end

  for _, keys in pairs(keymaps) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      local opts = Keys.opts(keys)
      ---@diagnostic disable-next-line: no-unknown
      opts.has = nil
      opts.silent = true
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
  end
end

return M
