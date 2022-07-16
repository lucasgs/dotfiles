local opts = { noremap = true, silent = true}
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General 
keymap("n", "<Leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<Leader>w", "<cmd>w<CR>", opts)
keymap('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', opts)
keymap("n", "<F10>", "<cmd>nohl<CR>", opts)
--keymap("n", "<F4>", "<cmd>terminal<CR>", opts)
-- keymap("n", "<F4>", "<cmd>sp term://zsh<CR>", opts)
keymap('n', '<Leader>t', '<cmd>sp term://zsh<CR>', opts)

keymap('n', '<Leader>l', '<cmd>echo "this is just a test"<CR>', opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

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

--lspconfig['kotlin_language_server'] {
--
    --on_attach = on_attach,
    --flags = lsp_flags,
--}

