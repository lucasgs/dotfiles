local options = {
  backup = false,
  background = "dark",
  clipboard = "unnamedplus",
  completeopt = { "menu", "menuone", "noselect" },
  cursorline = true,
  fileencoding = 'utf-8',
  guifont = "monospace:h14",
  hlsearch = true,
  hidden = true,
  ignorecase = true,
  incsearch = true,
  expandtab = true,
  -- laststatus = 3,
  mouse = "a",
  number = true,
  pumheight = 10,
  relativenumber = false,
  scrolloff = 8,
  showmode = false,
  shiftwidth = 2,
  sidescrolloff = 8,
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  tabstop = 2,
  wildmenu = true,
  wrap = true,
  updatetime = 50,
  -- colorcolumn = "80",
}
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

-- augroup ProjectDrawer
--   autocmd!
--   autocmd VimEnter * :Vexplore
-- augroup END

for k, v in pairs(options) do
  vim.opt[k] = v
end
