local M = {}

-- keybind utility functions
local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")

-- bind to a specific buffer
local function bind_bufnr(op, outer_opts)
    outer_opts = outer_opts or { noremap = true, silent = true }
    return function(buffer, lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.api.nvim_buf_set_keymap(buffer, op, lhs, rhs, opts)
    end
end

M.nnoremap_bufnr = bind_bufnr("n")

-- autocommand util function
-- copied from https://github.com/norcalli/nvim_utils
M.create_augroups = function(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command('augroup '..group_name)
        vim.api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command('augroup END')
    end
end

return M
