local status, tsc = pcall(require, "tsc")
if (not status) then return end

vim.notify = require("notify")

tsc.setup({})
