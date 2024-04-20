local status_ok, gen = pcall(require, 'gen')
if not status_ok then
  return
end

gen.setup({
  opts = {
    -- model = "mistral",
    model = "llama3",
    display_mode = "float", -- The display mode. Can be "float" or "split".
  }
})
