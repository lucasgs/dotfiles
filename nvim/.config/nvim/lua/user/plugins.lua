local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Automatically install packer
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  -- useful functions
  use 'nvim-lua/plenary.nvim'

  -- lsp
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  -- visual progress
  use {
    'j-hui/fidget.nvim',
    tag = 'legacy',
  }

  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'

  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  -- snippets
  use({
    "L3MON4D3/LuaSnip",
    tag = "v1.2.*",
    run = "make install_jsregexp"
  })
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  --file explorer
  -- use 'kyazdani42/nvim-tree.lua'
  --use 'kyazdani42/nvim-web-devicons' -- optional, for file icons

  -- markdown preview
  use { "ellisonleao/glow.nvim" }
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  -- text commenter
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- colorschemes
  -- use 'rafi/awesome-vim-colorschemes' -- Retro Scheme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    --run = ":CatppuccinCompile",
  }
  use 'folke/tokyonight.nvim'
  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'
  use 'rebelot/kanagawa.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- buffer line
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use { "moll/vim-bbye" }

  -- telescope / fuzzy finder
  use { 'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- telescope extensions
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'nvim-telescope/telescope-file-browser.nvim'

  -- manage term inside nvim
  use "akinsho/toggleterm.nvim"

  -- complete pairs
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'

  -- colorize hex and name colors
  use 'norcalli/nvim-colorizer.lua'

  -- to be very good at vimming
  use 'ThePrimeagen/vim-be-good'

  -- use({
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup()
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- })

  use {
    "luukvbaal/nnn.nvim",
    config = function() require("nnn").setup() end
  }

  -- markdown notes
  use {
    'JellyApple102/flote.nvim'
  }

  -- rest client
  use {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  -- typing practice
  use { 'BooleanCube/keylab.nvim' }

  -- surroundings
  use({
    "kylechui/nvim-surround",
    tag = "*"
  })

  use 'echasnovski/mini.nvim'

  -- personal wiki
  use { 'vimwiki/vimwiki' }

  -- use { "alexghergh/nvim-tmux-navigation" }

  -- undo history
  use { 'mbbill/undotree' }

  -- debugging
  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'theHamsta/nvim-dap-virtual-text' }

  -- diff
  use "sindrets/diffview.nvim"

  -- icons
  use 'nvim-tree/nvim-web-devicons'

  use 'ThePrimeagen/harpoon'

  use 'David-Kunz/gen.nvim'

  use "folke/which-key.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
