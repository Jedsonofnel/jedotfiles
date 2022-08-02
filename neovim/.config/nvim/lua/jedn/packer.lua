-- Plugins using packer!

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colourscheme
    use 'folke/tokyonight.nvim'

    -- Treesitter for syntax highlighting goodness!
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons', opt = true
        },
    }

    -- toggleterm
    use {
        'akinsho/toggleterm.nvim',
        tag = 'v2.*',
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x'
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    }

    -- all things lsp!
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- snippets (required by cmp)
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- utility
    use 'ahmedkhalf/project.nvim'
    use 'windwp/nvim-autopairs'
    use 'nvim-lua/plenary.nvim'
end)
