return {
	"smart-splits-nvim/smart-splits.nvim",
	version = "^3.0.0",
	-- branch = "v3",
	lazy = false,
	opts = { -- Plugin Configuration
		mux = {
			backend = "smart-splits-backend-kitty",
		},
	},
	dependencies = {
		{
			"smart-splits-nvim/backend-kitty",
			module = "smart-splits-backend-kitty",
			opts = { -- Backend Configuration
				-- password = 'secret',
			},
		},
	},
	keys = {
		{
			"<C-h>",
			function()
				require("smart-splits").move_cursor_left()
			end,
			desc = "focus leftside window",
		},
		{
			"<C-j>",
			function()
				require("smart-splits").move_cursor_down()
			end,
			desc = "focus downside window",
		},
		{
			"<C-k>",
			function()
				require("smart-splits").move_cursor_up()
			end,
			desc = "focus upside window",
		},
		{
			"<C-l>",
			function()
				require("smart-splits").move_cursor_right()
			end,
			desc = "focus rightside window",
		},
	},
}
