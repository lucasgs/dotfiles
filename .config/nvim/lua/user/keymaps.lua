local opts = { noremap = true, silent = true}
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<Leader>q", "<cmd>q!<CR>", opts)
keymap('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', opts)
keymap("n", "<F10>", "<cmd>nohl<CR>", opts)
keymap("n", "<F4>", "<cmd>terminal<CR>", opts)

keymap('n', '<Leader>t', '<cmd>echo "this is just a test"<CR>', opts)

-- Buffer navigation
-- keymap('n', '<C-K>', '<cmd>bnext<CR>', opts)
-- keymap('n', '<C-J>', '<cmd>bprev<CR>', opts)

-- Window navigation
keymap('n', '<C-H>', '<C-W><C-H>', opts)
keymap('n', '<C-J>', '<C-W><C-J>', opts)
keymap('n', '<C-K>', '<C-W><C-K>', opts)
keymap('n', '<C-L>', '<C-W><C-L>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

	-- LSP
  keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  keymap('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  keymap('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  keymap('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

	-- Diagnostic
	keymap('n', '<leader>dn', vim.diagnostic.goto_next, bufopts)
	keymap('n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)

	keymap("n", "<Leader>w", "<cmd>w<CR>", bufopts)

end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lspconfig['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
