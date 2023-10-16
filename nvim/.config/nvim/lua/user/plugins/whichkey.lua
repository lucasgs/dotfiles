local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup({})

whichkey.register({
  h = {
    name = "harpoon",
    a = { function() require('harpoon.mark').add_file() end, "Mark file" }
  }
}, { prefix = "<leader>" })
