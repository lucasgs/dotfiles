-- Format on save buffer
--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
-- or
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
