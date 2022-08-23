local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = false,
    -- theme = 'tokyonight',
    theme = "onedark",
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
