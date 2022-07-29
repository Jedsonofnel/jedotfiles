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

    -- utility
    use 'ahmedkhalf/project.nvim'
    use 'windwp/nvim-autopairs' 
    use 'nvim-lua/plenary.nvim'
end)
