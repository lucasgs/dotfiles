-- -- local colorscheme = "onedark"
-- local colorscheme = "hybrid"
--
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

-- Catppuccin
-- local status_ok, catppuccin = pcall(require, "catppuccin")
-- if not status_ok then
--   return
-- end
--
-- catppuccin.setup {}
--
-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- vim.cmd [[colorscheme catppuccin]]

-- Tokyo
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.cmd [[colorscheme tokyonight]]