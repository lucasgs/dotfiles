local M = {}

function M.basic()
  -- local colorscheme = "onedark"
  local colorscheme = "hybrid"
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
  end
end

function M.gruvbuddy()
  -- Gruvbuddy
  local status_ok, colorbuddy = pcall(require, "colorbuddy")
  if not status_ok then
    return
  end

  colorbuddy.colorscheme('gruvbuddy')

  local Color, colors, Group, groups, styles = require('colorbuddy').setup()

  Group.new("WinSeparator", nil, nil)
  Group.new("VertSplit", nil, nil)

  -- custom colors
  -- Color.new("myyellow", '#e9c46a')
  -- Group.new("Function", colors.myyellow)
  -- Group.new("TypDef", colors.myyellow)
end

function M.catppuccin()
  -- Catppuccin
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end

  catppuccin.setup {}

  vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
  vim.cmd [[colorscheme catppuccin]]
end

function M.tokyo()
  -- Tokyo
  vim.g.tokyonight_style = "night" --night, storm, day, moon
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

  vim.cmd [[colorscheme tokyonight]]
end

return M
