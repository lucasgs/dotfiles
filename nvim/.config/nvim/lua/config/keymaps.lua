local keymap = vim.keymap.set

-- select all text
keymap("n", "<Leader>a", "gg<S-v>G", { desc = "Select all text" })

-- yank all text
keymap("n", "<Leader>ya", "gg<S-v>Gy", { desc = "Yank all text" })

-- duplicate line
keymap("n", "<C-y>", "yyp", { desc = "Duplicate line" })

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

-- Buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)

keymap("n", "<leader>n", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>p", "<cmd>bp<cr>", { desc = "Prev buffer" })
keymap("n", "<leader>x", "<cmd>bd<cr>", { desc = "Delete buffer" })
keymap("n", "<Leader>so", "<cmd>source %<CR>", { desc = "Source current buffer" })

-- Splits
keymap("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<leader>-", "<cmd>split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open floating terminal" })
keymap("n", "<leader>tj", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Open below terminal" })
keymap("n", "<leader>tl", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Open right terminal" })

keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "Grep word" })
keymap("n", "<leader>fg", "<cmd>FzfLua grep<cr>", { desc = "Grep" })

keymap("n", "-", "<cmd>Oil<CR>", { desc = "Toggle Oil" })
