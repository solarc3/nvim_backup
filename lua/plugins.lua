vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    use {
        'williamboman/mason.nvim',
        config = function()
            require('config/mason')
        end
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('config/masonlsp')
        end
    }
    use ({
        'lervag/vimtex',
        config = function()
            require('config/vimtex')
        end
        })
-- The New League of autocomplete
--   use {
--        'hrsh7th/nvim-cmp',
--        config = function()
--            require('config/nvim-cmp')
--        end
--    }

    --use {
    --   'hrsh7th/cmp-nvim-lsp',
--        'hrsh7th/cmp-buffer',
--        'hrsh7th/cmp-path',
--        'hrsh7th/cmp-cmdline',
--        'saadparwaiz1/cmp_luasnip',
    --}
--    use {
--        'amarakon/nvim-cmp-lua-latex-symbols',
--        config = function()
--            require('config/cmplatex')
--        end
--    }

    -- Snippets Jam
    use {
        'L3MON4D3/LuaSnip',
        tag = 'v<CurrentMajor>.*',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    }
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind-nvim'  -- Adds nerd font icons ( in lualine )

    use 'sainnhe/gruvbox-material'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('config/lualine')
        end
      }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('config/lsp')
        end
    }
    use {
        'SmiteshP/nvim-navic',
        config = function()
            require('config/navic')
        end,
        requires = {'neovim/nvim-lspconfig'}
    }
    use {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('config/web')
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('config/indent')
        end
    }
    use {
        'ms-jpq/chadtree'
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
                require('config/telescope')
            end,                                       --needs to be configured with plenary.nvim and popup.nvim
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
--    use 'dense-analysis/ale'
    use {
        "sitiom/nvim-numbertoggle",
        config = function()
           require("numbertoggle").setup()
        end
    }
    use{
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('config/null')
        end,
        requires = {"nvim/plenary.nvim"},
    }
    use{
        'jayp0521/mason-null-ls.nvim',
        config = function()
            require('config/masonls')
        end
    }
    use{
        'ms-jpq/coq-nvim',
        config = function()
            require('config/coq')
        end
   }
    use 'ms-jpq/coq.artifacts'
    use {
        'ms-jpq/coq.thirdparty',
        config = function()
            require('config/coc3')
        end
    }
--    use {
--        'glepnir/dashboard-nvim',
--        config = function()
--            require('config/dashboard')
--        end
--    }
    use {
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = "require('config.alpha')",
        cmd = {
        "Alpha",
        "AlphaRedraw"
        },
        event = "BufWinEnter",
    }
--    use {
--        'mweisshaupt1988/neobeans.vim',
--        as = 'neobeans',
--        config = function()
--            require('config/neobeans')
--        end
--    }
    use {
    'karb94/neoscroll.nvim',
    config = function()
        require('config/neoscroll')
    end
    }
    use {'shaunsingh/oxocarbon.nvim', branch = 'fennel'}
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {} 
        end
    }
    use {'andweeb/presence.nvim'}
    use { 'tpope/vim-fugitive'}
end)
