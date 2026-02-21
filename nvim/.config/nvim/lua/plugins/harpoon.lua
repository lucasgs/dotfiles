return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>hm",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Harpoon quick menu",
		},
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon add",
		},
		{
			"<leader>hn",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon next",
		},
		{
			"<leader>hp",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon prev",
		},
		{
			"<leader>hc",
			function()
				require("harpoon"):list():clear()
			end,
			desc = "Harpoon clear all",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon nav file 1",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon nav file 2",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon nav file 3",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon nav file 4",
		},
		{
			"<leader>5",
			function()
				require("harpoon"):list():select(5)
			end,
			desc = "Harpoon nav file 5",
		},
		{
			"<leader>6",
			function()
				require("harpoon"):list():select(6)
			end,
			desc = "Harpoon nav file 6",
		},
	},
}
