local status_ok, keylab = pcall(require, "keylab")
if not status_ok then
  return
end

keylab.setup({
  LINES = 15,             -- 10 by default
  force_accuracy = false, -- true by default
  correct_fg = "#FFFFFF", -- #B8BB26 by default
  wrong_bg = "#000000"    -- #FB4934 by default
})
