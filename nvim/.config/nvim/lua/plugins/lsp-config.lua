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

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			bashls = {},
			pylsp = {},
			clangd = {},
			html = {},
			cssls = {},
			ts_ls = {},
			rust_analyzer = {},
			-- kotlin_language_server = {},
			groovyls = {},
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
			automatic_enable = true,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
					-- vim.lsp.config[server_name] = server
				end,
			},
		})

		vim.lsp.config["kotlinls"] = {
			cmd = { "kotlin-ls", "--stdio" },
			single_file_support = true,
			filetypes = { "kotlin" },
			root_markers = { "build.gradle", "build.gradle.kts", "pom.xml" },
		}
	end,
}
