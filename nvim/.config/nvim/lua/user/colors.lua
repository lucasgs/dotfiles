local ok, themes = pcall(require, 'user.themes')
if not ok then
  return
end

themes.kanagawa()

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = 'white', bold = true })
