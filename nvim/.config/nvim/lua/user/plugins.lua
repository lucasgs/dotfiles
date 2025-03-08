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

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- {
	--     "nvim-treesitter/nvim-treesitter-textobjects",
	--     dependencies = "nvim-treesitter/nvim-treesitter",
	-- },
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
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
			})
		end,
	},

	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},

	{ "rose-pine/neovim", name = "rose-pine" },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	{
		"akinsho/bufferline.nvim",
		branch = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	{ "moll/vim-bbye" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	"nvim-telescope/telescope-file-browser.nvim",

	"akinsho/toggleterm.nvim",

	"windwp/nvim-ts-autotag",

	"norcalli/nvim-colorizer.lua",

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
		"mfussenegger/nvim-lint",
	},

	{
		"mhartington/formatter.nvim",
	},

	{
		"folke/trouble.nvim",
	},

	{
		"stevearc/conform.nvim",
		opts = {},
	},

	{
		"folke/neodev.nvim",
		opts = {},
	},

	{ "David-Kunz/gen.nvim" },

	{ "andrewferrier/debugprint.nvim" },

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"rest-nvim/rest.nvim",
	},
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
	},
	{
		"rcarriga/nvim-notify",
	},
	{
		"dmmulroy/tsc.nvim",
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			-- add any opts here
			-- for example
			provider = "ollama",
			cursor_applying_provider = "ollama",
			behaviour = {
				enable_cursor_planning_mode = true, -- enable cursor planning mode!
			},
			vendors = {
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "DEEPSEEK_API_KEY",
					endpoint = "https://api.deepseek.com",
					model = "deepseek-chat",
				},
				ollama = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = "http://127.0.0.1:11434/v1",
					-- model = "deepseek-r1:1.5b",
					model = "deepseek-r1:latest",
					disable_tools = true,
				},
			}, -- openai = {
			-- 	endpoint = "https://api.openai.com/v1",
			-- 	model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
			-- 	timeout = 30000, -- timeout in milliseconds
			-- 	temperature = 0, -- adjust if needed
			-- 	max_tokens = 4096,
			-- 	-- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
			-- },
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}

require("lazy").setup(plugins)
