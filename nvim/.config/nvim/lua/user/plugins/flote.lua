local status_ok, flote = pcall(require, "flote")
if not status_ok then
  return
end

flote.setup {
  q_to_quit = true,
  window_style = 'minimal',
  window_border = 'solid',
  window_title = true
}
