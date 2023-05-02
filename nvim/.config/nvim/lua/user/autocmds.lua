-- Format on save buffer
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Highlight yanked selection
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Always start term in insert mode
--vim.cmd [[autocmd BufWinEnter,WinEnter term://* startinsert]]
