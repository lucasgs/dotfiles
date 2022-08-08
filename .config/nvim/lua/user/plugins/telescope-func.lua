local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local M = {}

function M.find_files()
  local opts = { previewer = false }
  builtin.find_files(themes.get_dropdown(opts))
end

function M.buffers()
  local opts = { previewer = false }
  builtin.buffers(themes.get_dropdown(opts))
end

return M
