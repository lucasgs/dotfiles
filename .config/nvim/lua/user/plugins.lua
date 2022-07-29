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

  -- lsp
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  -- lsp installer
  -- use "williamboman/nvim-lsp-installer"

  -- mason
  use "williamboman/mason.nvim"

  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  --file explorer
  use 'kyazdani42/nvim-tree.lua'

  use 'kyazdani42/nvim-web-devicons' -- optional, for file icons

  -- markdown preview
  use { "ellisonleao/glow.nvim" }

  -- text commenter
  use "terrortylor/nvim-comment"

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- colorschemes
  use 'rafi/awesome-vim-colorschemes' -- Retro Scheme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    --run = ":CatppuccinCompile",
  }
  use 'folke/tokyonight.nvim'

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- buffer line
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- telescope / fuzzy finder
  use { 'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- toggleterm
  use "akinsho/toggleterm.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
