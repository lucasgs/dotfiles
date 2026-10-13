return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- map('gD', vim.lsp.buf.declaration, 'Goto declaration')
				map("gd", vim.lsp.buf.definition, "Goto definition")
				map("K", vim.lsp.buf.hover, "Hover documentation")
				map("gi", vim.lsp.buf.implementation, "Goto implementation")
				map("<leader>D", vim.lsp.buf.type_definition, "Goto type definition")
				map("<leader>rn", vim.lsp.buf.rename, "Rename")
				map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
				map("<leader>gr", vim.lsp.buf.references, "Goto references")
				-- map('<leader>fu', vim.lsp.buf.format({ async = true }), 'Format buffer')
				-- map("<leader>sh", vim.lsp.buf.signature_help, "Signature help")
				map("<leader>dj", vim.diagnostic.goto_next, "Diagnostic next")
				map("<leader>dk", vim.diagnostic.goto_prev, "Diagnostic prev")
				map("<leader>dl", vim.diagnostic.setloclist, "Diagnostic set local list")

				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("custom-lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						-- vim.api.nvim_clear_autocmds { group = 'custom-lsp-highlight', buffer = event2.buf }
					end,
				})
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.hover({
			border = "rounded",
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		--- Interpreter for a pyright workspace: $VIRTUAL_ENV wins, then <root>/.venv, then <root>/venv.
		---@param root_dir string|nil
		---@return string|nil
		local function python_interpreter(root_dir)
			local venvs = {}
			if vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV ~= "" then
				venvs[#venvs + 1] = vim.env.VIRTUAL_ENV
			end
			if root_dir and root_dir ~= "" then
				venvs[#venvs + 1] = vim.fs.joinpath(root_dir, ".venv")
				venvs[#venvs + 1] = vim.fs.joinpath(root_dir, "venv")
			end
			for _, venv in ipairs(venvs) do
				for _, exe in ipairs({ "bin/python", "bin/python3", "Scripts/python.exe" }) do
					local path = vim.fs.joinpath(venv, exe)
					if vim.uv.fs_stat(path) then
						return path
					end
				end
			end
			return nil
		end

		local servers = {
			bashls = {},
			-- pylsp = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			pyright = {
				settings = {
					python = {
						analysis = { typeCheckingMode = "basic" },
					},
				},
				-- Resolve the interpreter per workspace; fall through to pyright's own lookup when no venv exists.
				before_init = function(_, config)
					local folder = config.workspace_folders and config.workspace_folders[1]
					local root_dir = folder and vim.uri_to_fname(folder.uri) or vim.uv.cwd()
					local python = python_interpreter(root_dir)
					if python then
						config.settings.python = vim.tbl_deep_extend("force", config.settings.python or {}, {
							pythonPath = python,
						})
					end
				end,
			},
			clangd = {},
			html = {},
			cssls = {},
			ts_ls = {},
			rust_analyzer = {},
			kotlin_language_server = {},
			-- groovyls = {},
			gopls = {},
			jsonls = {},
			-- harper_ls = {},
			-- sourcekit = {
			--     capabilities = {
			--         workspace = {
			--             didChangeWatchedFiles = {
			--                 dynamicRegistration = true,
			--             },
			--         },
			--     },
			-- },
			-- kotlin_ls = {
			-- 	cmd = { "kotlin-ls", "--stdio" },
			-- 	single_file_support = true,
			-- 	filetypes = { "kotlin" },
			-- 	root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
			-- },
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = {}, -- explicitly set to an empty table (Populated via mason-tool-installer)
			automatic_installation = false,
			-- Keep false: `true` enables *every* mason-installed LSP (marksman, stylua, ...)
			-- with lspconfig defaults, bypassing the `servers` opts below.
			automatic_enable = false,
		})

		-- Nvim 0.11+ requires vim.lsp.config/vim.lsp.enable; the legacy
		-- `require("lspconfig")[name].setup(opts)` path silently discards opts.
		for server_name, server in pairs(servers) do
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			vim.lsp.config(server_name, server)
		end
		vim.lsp.enable(vim.tbl_keys(servers))

		-- JetBrains kotlin-lsp (homebrew cask "kotlin-lsp" -> bin/kotlin-lsp / intellij-server).
		-- Note: lspconfig's shipped config for this server is named "kotlin_lsp";
		-- setting vim.lsp.config is not enough, it must also be enabled.
		vim.lsp.config("kotlin_lsp", {
			cmd = { "kotlin-lsp", "--stdio" },
			filetypes = { "kotlin" },
			root_markers = {
				"settings.gradle",
				"settings.gradle.kts",
				"build.gradle",
				"build.gradle.kts",
				"pom.xml",
				"workspace.json",
				".git",
			},
		})
		vim.lsp.enable("kotlin_lsp")
	end,
}
