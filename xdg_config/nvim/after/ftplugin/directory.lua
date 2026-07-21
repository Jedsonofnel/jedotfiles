-- little dir.lua keybind plugin

local function bufdir()
    return vim.api.nvim_buf_get_name(0)
end

local function cursor_entry()
    local line = vim.fn.getline(".")
    return line:gsub("/$", "")
end

local function full_path(entry)
    return bufdir() .. entry
end

local function refresh()
    vim.cmd("edit!")
end

-- % create new file (netrw default)
vim.keymap.set("n", "%", function()
    vim.ui.input({ prompt = "New file: ", default = bufdir() }, function(name)
        if not name or name == "" then
            return
        end
        local f = io.open(name, "w")
        if f then
            f:close()
        end
        vim.cmd.edit(name)
    end)
end, { buffer = true, desc = "New file" })

-- d create new directory (netrw default)
vim.keymap.set("n", "d", function()
    vim.ui.input({ prompt = "New dir: ", default = bufdir() }, function(name)
        if not name or name == "" then
            return
        end
        vim.fn.mkdir(name, "p")
        refresh()
    end)
end, { buffer = true, desc = "New directory" })

-- r rename (R is taken by dir.lua reload)
vim.keymap.set("n", "r", function()
    local entry = cursor_entry()
    if entry == "" then
        return
    end
    local src = full_path(entry)
    vim.ui.input({ prompt = "Rename: ", default = src }, function(dst)
        if not dst or dst == "" or dst == src then
            return
        end
        vim.fn.rename(src, dst)
        refresh()
    end)
end, { buffer = true, desc = "Rename" })

-- D delete (netrw default)
vim.keymap.set("n", "D", function()
    local entry = cursor_entry()
    if entry == "" then
        return
    end
    local path = full_path(entry)
    vim.ui.input({ prompt = 'Delete "' .. entry .. '"? (y/N): ' }, function(ans)
        if ans ~= "y" and ans ~= "Y" then
            return
        end
        vim.fn.delete(path, "rf")
        refresh()
    end)
end, { buffer = true, desc = "Delete" })
