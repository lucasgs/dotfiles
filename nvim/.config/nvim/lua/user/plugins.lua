local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])
--

local plugins = {

    "nvim-lua/plenary.nvim",

    "neovim/nvim-lspconfig",

    "williamboman/mason.nvim",
    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     dependencies = { "mason.nvim" },
    --     config = function()
    --         require("mason-lspconfig").setup()
    --         require("mason-lspconfig").setup_handlers({
    --             function(server_name)
    --                 require("lspconfig")[server_name].setup({})
    --             end,
    --         })
    --     end,
    -- },

    "j-hui/fidget.nvim",

    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
    },

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",

    {
        "L3MON4D3/LuaSnip",
        version = "v1.2.*",
        build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",

    { "ellisonleao/glow.nvim" },

    { "numToStr/Comment.nvim" },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",

    {
        "catppuccin/nvim",
        name = "catppuccin",
        --build = ":CatppuccinCompile",
    },
    "folke/tokyonight.nvim",
    "tjdevries/colorbuddy.vim",
    "tjdevries/gruvbuddy.nvim",
    "rebelot/kanagawa.nvim",
    {
        "svrana/neosolarized.nvim",
        dependencies = { "tjdevries/colorbuddy.nvim" },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    },

    { "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },
    { "moll/vim-bbye" },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },

    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    "nvim-telescope/telescope-file-browser.nvim",

    "akinsho/toggleterm.nvim",

    "windwp/nvim-ts-autotag",
    "windwp/nvim-autopairs",

    "norcalli/nvim-colorizer.lua",

    "ThePrimeagen/vim-be-good",

    -- {
    --   "jackMort/ChatGPT.nvim",
    --   config = function()
    --     require("chatgpt").setup()
    --   end,
    --   dependencies = {
    --     "MunifTanjim/nui.nvim",
    --     "nvim-lua/plenary.nvim",
    --     "nvim-telescope/telescope.nvim"
    --   }
    -- }

    {
        "JellyApple102/flote.nvim",
    },

    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    },

    { "echasnovski/mini.nvim" },

    { "vimwiki/vimwiki" },

    { "mbbill/undotree" },

    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },

    "sindrets/diffview.nvim",

    "ThePrimeagen/harpoon",

    "David-Kunz/gen.nvim",

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

    {
        'mfussenegger/nvim-lint'
    },

    {
        'mhartington/formatter.nvim'
    },

    {
        "folke/trouble.nvim",
    },

    {
        'stevearc/conform.nvim',
        opts = {},
    },

    {
        "folke/neodev.nvim",
        opts = {}
    },

    { "David-Kunz/gen.nvim" },

    { "andrewferrier/debugprint.nvim" },
}

require("lazy").setup(plugins)
