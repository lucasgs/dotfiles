local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

formatter.setup({
  filetype = {
    python = {
      function()
        return {
          exe = "ruff",
          args = { "format", "-q", "-" },
          stdin = true,
        }
      end,
    }
  }
})
