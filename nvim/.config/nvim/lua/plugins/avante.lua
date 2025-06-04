return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		-- provider = "ollama",
		-- auto_suggestions_provider = "ollama",
		-- cursor_applying_provider = "ollama",
		provider = "gemini",
		-- cursor_applying_provider = "gemini",
		behaviour = {
			enable_cursor_planning_mode = true, -- enable cursor planning mode!
		},
		providers = {
			ollama = {
				api_key_name = "",
				-- model = "deepseek-r1:latest",
				model = "qwen2.5-coder:7b-instruct",
				__inherited_from = "openai",
				endpoint = "http://127.0.0.1:11434",
			},
			vendors = {
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "DEEPSEEK_API_KEY",
					endpoint = "https://api.deepseek.com",
					model = "deepseek-chat",
				},
			},
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
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
}
