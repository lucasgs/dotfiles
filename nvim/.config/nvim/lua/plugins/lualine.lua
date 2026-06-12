local function macro_recording()
	local reg = vim.fn.reg_recording()
	if reg == "" then
		return ""
	end
	return "REC @" .. reg
end

return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = { 'nvim-tree/nvim-web-devicons' }
	opts = {
		options = {
			icons_enabled = false,
			theme = "auto",
			section_separators = "",
			component_separators = "",
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 3 } },
			-- lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_x = {
				"filetype",
				{
					macro_recording,
					color = { fg = "#ff9e64" },
				},
			},
			-- lualine_y = { "progress" },
			lualine_y = {},
			lualine_z = { "location" },
		},
	},
}
