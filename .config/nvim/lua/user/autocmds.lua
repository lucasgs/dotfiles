--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
-- or
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
