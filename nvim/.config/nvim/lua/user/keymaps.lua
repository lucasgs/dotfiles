local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.keymap.set

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General

-- Quit
-- keymap("n", "<Leader>q", "<cmd>q<CR>", opts)
-- keymap("n", "<Leader>q", "<cmd>bd %<CR>", opts)
keymap("n", "<Leader>qq", "<cmd>qa<CR>", opts)
keymap("n", "<Leader>w", "<cmd>w<CR>", opts)

-- Explorer
-- keymap('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<Leader>e', '<cmd>Ex<CR>', opts)
-- keymap('n', '<Leader>e', '<cmd>Telescope file_browser<CR>', opts)

-- Integrated terminal
--keymap("n", "<F4>", "<cmd>terminal<CR>", opts)
-- keymap("n", "<F4>", "<cmd>sp term://zsh<CR>", opts)
-- keymap('n', '<Leader>t', '<cmd>sp term://zsh<CR>', opts)
-- keymap('n', '<Leader>t', '<cmd>ToggleTerm<CR>', opts)

-- Lazy git
keymap('n', '<Leader>lz', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', opts)

-- source current buffer
keymap('n', '<Leader>so', '<cmd>so %<CR>', opts)

-- make current file executable
keymap('n', '<Leader>x', '<cmd>!chmod +x %<CR>', opts)

-- select all text
keymap('n', '<Leader>a', 'gg<S-v>G', opts)

-- yank all text
keymap('n', '<Leader>ya', 'gg<S-v>Gy', opts)

-- duplicate line
keymap('n', '<C-y>', 'yyp', opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", "<cmd>resize +3<CR>", opts)
keymap("n", "<A-Down>", "<cmd>resize -3<CR>", opts)
keymap("n", "<A-Left>", "<cmd>vertical resize +3<CR>", opts)
keymap("n", "<A-Right>", "<cmd>vertical resize -3<CR>", opts)

-- Change 2 split windows from vert to horiz or horiz to vert
keymap("n", "<leader>th", "<C-w>t<C-w>H", opts)
keymap("n", "<leader>tk", "<C-w>t<C-w>K", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- Splits
keymap("n", "<leader>sv", "<cmd>vnew<CR>", opts)
keymap("n", "<leader>ss", "<cmd>split<CR>", opts)

-- Find files using Telescope command-line sugar.
keymap("n", "<leader>ff", "<cmd>lua require('user.plugins.telescope-func').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('user.plugins.telescope-func').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>",
  opts)
keymap("n", "<leader>fw", "<cmd>lua require'telescope.builtin'.grep_string()<CR>", opts)
keymap("n", "<leader>nv", "<cmd>lua require('user.plugins.telescope-func').edit_nvim()<CR>", opts)

-- no highlighting
-- keymap("n", "<F10>", "<cmd>nohl<CR>", opts)
-- keymap("n", "<C-l>", "<cmd>nohl<CR>", opts)
-- keymap("n", "<leader>h", "<cmd>nohl<CR>", opts)
keymap("n", "<esc>", "<cmd>noh<cr>", opts)

-- quick fix list
keymap("n", "<leader>co", "<cmd>copen<CR>", opts)
keymap("n", "<leader>cc", "<cmd>cclose<CR>", opts)

-- move page and center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<cmd>m .-2<CR>==", opts)

-- Paste and overwrite
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Rest client
keymap("n", "<leader>rr", "<Plug>RestNvim", opts)
keymap("n", "<leader>rp", "<Plug>RestNvimPreview", opts)
keymap("n", "<leader>rl", "<Plug>RestNvimLast", opts)
