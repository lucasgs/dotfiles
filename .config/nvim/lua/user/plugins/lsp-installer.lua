local status_ok, installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
  return
end

installer.setup {}
