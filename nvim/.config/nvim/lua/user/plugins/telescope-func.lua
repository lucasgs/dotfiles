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

function M.edit_nvim()
  builtin.find_files {
    shorten_path = false,
    cwd = "~/.config/nvim/",
    prompt = "~ nvim dotfiles ~",
    hidden = true,
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.55,
    },
  }
end

return M
