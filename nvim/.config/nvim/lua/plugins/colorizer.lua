return {
	"catgoose/nvim-colorizer.lua",
	opts = {},
	config = function()
		require("colorizer").setup({
			options = { parsers = { css = true } },
		})
	end,
}
