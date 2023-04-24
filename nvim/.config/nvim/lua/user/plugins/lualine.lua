local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local theme_name = vim.cmd "colorscheme"

lualine.setup {
  options = {
    icons_enabled = false,
    -- theme = 'tokyonight',
    -- theme = "onedark",
    -- theme = "catppuccin",
    theme = theme_name,
    section_separators = '',
    component_separators = '',
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 3 }, },
    -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_x = { 'filetype' },
    -- lualine_y = { 'progress' },
    lualine_y = {},
    lualine_z = { 'location' }
  },

}
