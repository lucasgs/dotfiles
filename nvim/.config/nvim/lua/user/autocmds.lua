vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  desc = 'Format current buffer before writing',
  group = vim.api.nvim_create_augroup('OwnFormatWriting', { clear = true }),
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  desc = "Highlight yanked selection",
  group = vim.api.nvim_create_augroup('OwnYankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  desc = "Run linter after writing",
  group = vim.api.nvim_create_augroup('OwnLintWrite', { clear = true }),
  callback = function()
    require("lint").try_lint()
  end,
})
