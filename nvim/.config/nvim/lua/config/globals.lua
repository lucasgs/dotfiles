local reloader = nil
local ok, plenary_reload = pcall(require, "plenary.reload")
if not ok then
	reloader = require
else
	reloader = plenary_reload.reload_module
end

P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return reloader(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

local M = {}

function M.execCmd(name)
	local Terminal = require("toggleterm.terminal").Terminal
	local cmd = Terminal:new({ cmd = name, hidden = true, direction = "float" })
	cmd:toggle()
end

function M.open_lazygit()
	M.execCmd("lazygit")
end

function M.open_htop()
	M.execCmd("htop")
end

return M
