vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	desc = "Highlight yanked selection",
	group = vim.api.nvim_create_augroup("OwnYankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	desc = "Run linter after writing",
-- 	group = vim.api.nvim_create_augroup("OwnLintWrite", { clear = true }),
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })

-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
	local current_value = vim.diagnostic.config().virtual_text
	if current_value then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end, {})

-- Command to toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
	local is_enabled = vim.diagnostic.is_enabled()
	vim.diagnostic.enable(not is_enabled)
end, {})

vim.api.nvim_create_user_command("BufferToggleWord", function()
	local replacements = {}
	replacements["true"] = "false"
	replacements["false"] = "true"
	replacements["True"] = "False"
	replacements["False"] = "True"
	replacements["0"] = "1"
	replacements["1"] = "0"

	local function tableHasKey(table, key)
		return table[key] ~= nil
	end

	local function get_word_to_replace(original_word)
		local new_word = original_word
		if tableHasKey(replacements, new_word) then
			new_word = replacements[original_word]
		end
		return new_word
	end

	local function get_word_under_cursor()
		local cword = vim.fn.expand("<cword>")
		return cword
	end

	local function replace_word(word)
		vim.cmd("normal! ciw" .. word)
	end

	local cword = get_word_under_cursor()
	if cword ~= "" then
		local newword = get_word_to_replace(cword)
		replace_word(newword)
	end
end, {})

-- Configure make automatically based on language
local buildsystems = vim.api.nvim_create_augroup("buildsystems", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = buildsystems,
	pattern = { "c", "cpp", "python", "java", "kotlin" },
	callback = function(args)
		local filetype = args.match

		local settings = {
			c = { makeprg = "make", errorformat = "%f:%l:%c: %m" },
			cpp = { makeprg = "make", errorformat = "%f:%l:%c: %m" },
			python = { makeprg = "python %", errorformat = "%f:%l: %m" },
			java = { makeprg = "javac % && java -cp %:p:h %:t:r", errorformat = "%f:%l: %m" },
			kotlin = {
				makeprg = "gradle assemble",
				errorformat = "%E> Task :%m FAILED," .. "%Ee: file://%f:%l:%c %m," .. "%Z," .. "%-G%.%#",
			},
		}

		if settings[filetype] then
			vim.opt_local.makeprg = settings[filetype].makeprg
			vim.opt_local.errorformat = settings[filetype].errorformat or "%f:%l: %m" -- Default error format
		end
	end,
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	desc = "Highlight yanked selection",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_user_command("Google", function(o)
	-- local escaped = require('socket.url').escape(o.args)
	local escaped = vim.uri_encode(o.args)
	local url = ("https://www.google.com/search?q=%s"):format(escaped)
	vim.ui.open(url)
end, { nargs = 1, desc = "just google it" })
