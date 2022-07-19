local cmp_status_ok, telescope = pcall(require, 'telescope')
if not cmp_status_ok then
  return
end

telescope.setup {}
