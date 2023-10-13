local M = {}

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

  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
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

function M.kanagawa()
  local status_ok, kanagawa = pcall(require, "kanagawa")
  if not status_ok then
    return
  end

  kanagawa.setup {}

  vim.cmd("colorscheme kanagawa-wave")
  -- vim.cmd("colorscheme kanagawa-dragon")
  -- vim.cmd("colorscheme kanagawa-lotus")
  -- vim.cmd("colorscheme kanagawa")
end

function M.neosolarized()
  local status, n = pcall(require, "neosolarized")
  if (not status) then return end

  n.setup({
    comment_italics = true,
  })

  local cb = require('colorbuddy.init')
  local Color = cb.Color
  local colors = cb.colors
  local Group = cb.Group
  local groups = cb.groups
  local styles = cb.styles

  Color.new('white', '#ffffff')
  Color.new('black', '#000000')
  Group.new('Normal', colors.base1, colors.NONE, styles.NONE)
  Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
  Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
  Group.new('Visual', colors.none, colors.base03, styles.reverse)

  local cError = groups.Error.fg
  local cInfo = groups.Information.fg
  local cWarn = groups.Warning.fg
  local cHint = groups.Hint.fg

  Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
  Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
  Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
  Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
  Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
  Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
  Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
  Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)

  Group.new("HoverBorder", colors.yellow, colors.none, styles.NONE)
end

return M
