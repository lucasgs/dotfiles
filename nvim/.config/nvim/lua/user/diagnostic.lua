-- Diagnostic options, see: `:help vim.diagnostic.config`
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    show_header = true,
    -- focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    -- format = function(d)
    --   local t = vim.deepcopy(d)
    --   local code = d.code or d.user_data.lsp.code
    --   if code then
    --     t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
    --   end
    --   return t.message
    -- end,
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
