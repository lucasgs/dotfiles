local keymap = vim.keymap.set

-- Quit
keymap("n", "<Leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })
--keymap("n", "<Leader>w", "<cmd>w<CR>", { desc = "Write buffer" })

keymap("n", "<Leader>w", "*", { desc = "Search current word" })

-- make current file executable
keymap("n", "<Leader>xe", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable" })

keymap("n", "<Leader>rr", "<cmd>silent make<CR>", { desc = "Run make" })

-- select all text
keymap("n", "<Leader>sa", "gg<S-v>G", { desc = "Select all text" })

-- yank all text
keymap("n", "<Leader>ya", "gg<S-v>Gy", { desc = "Yank all text" })

-- duplicate line
keymap("n", "<C-y>", "yyp", { desc = "Duplicate line" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Focus left buffer" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Focus buffer below" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Focus buffer above" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Focus right buffer" })

-- Resize with arrows
keymap("n", "<A-Up>", "<cmd>resize +3<CR>", { desc = "Resize more horiz" })
keymap("n", "<A-Down>", "<cmd>resize -3<CR>", { desc = "Resize less horiz" })
keymap("n", "<A-Left>", "<cmd>vertical resize +3<CR>", { desc = "Resize more vert" })
keymap("n", "<A-Right>", "<cmd>vertical resize -3<CR>", { desc = "Resize less vert" })

-- Buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
keymap("n", "<leader>n", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>p", "<cmd>bp<cr>", { desc = "Prev buffer" })
keymap("n", "<leader>x", "<cmd>bd<cr>", { desc = "Delete buffer" })
keymap("n", "<Leader>so", "<cmd>source %<CR>", { desc = "Source current buffer" })
keymap("n", "<Leader>fu", vim.lsp.buf.format, { desc = "Format current buffer" })

-- Splits
keymap("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<leader>-", "<cmd>split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open floating terminal" })
keymap("n", "<leader>tj", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Open below terminal" })
keymap("n", "<leader>tl", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Open right terminal" })
keymap("n", "<leader>th", "<C-w>t<C-w>H", { desc = "Change split vert to horiz" })
keymap("n", "<leader>tk", "<C-w>t<C-w>K", { desc = "Change split horiz to vert" })

keymap("n", "<esc>", "<cmd>noh<cr>", { desc = "No highlight" })

-- quick fix list
keymap("n", "<leader>co", "<cmd>copen<CR>", { desc = "Open quick fix list" })
keymap("n", "<leader>cc", "<cmd>cclose<CR>", { desc = "Close quick fix list" })

-- move page and center
keymap("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })

keymap("n", "gh", "^", { desc = "Goto start of the line" })
keymap("n", "gl", "$", { desc = "Goto end of the line" })

keymap("i", "jk", "<ESC>", { desc = "Faster <ESC>" })

keymap("v", "<", "<gv", { desc = "Indent more" })
keymap("v", ">", ">gv", { desc = "Indent less" })

-- Move text up and down
keymap("n", "<A-j>", "<cmd>m .+1<CR>==") -- move line up(n)
keymap("n", "<A-k>", "<cmd>m .-2<CR>==") -- move line down(n)
keymap("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv") -- move line up(v)
keymap("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv") -- move line down(v)-

keymap("v", "p", '"_dP', { desc = "Paste and overwrite" })

-- Rest client
-- keymap("n", "<leader>ro", "<cmd>Rest open<CR>", { desc = "Rest open" })
-- keymap("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = "Rest run" })
-- keymap("n", "<leader>rw", "<cmd>Rest env show<CR>", { desc = "Rest environment show" })
-- keymap("n", "<leader>rs", "<cmd>Rest env select<CR>", { desc = "Rest environment select" })

-- undotree
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle Undotree" })

-- keymap("n", "<leader>tw", "<cmd>BufferToggleWord<cr>", { desc = "Toggle current word" })

-- diagnostics
keymap("n", "<leader>dt", "<cmd>DiagnosticsToggle<CR>", { desc = "Toggle Diagnostics" })
keymap("n", "<leader>dt", "<cmd>DiagnosticsToggle<CR>", { desc = "Toggle Diagnostics" })
keymap("n", "<leader>dv", "<cmd>DiagnosticsToggleVirtualText<CR>", { desc = "Toggle Diagnostics Virtual Text" })
keymap("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show Diagnostics float window" })

-- General
keymap("n", "<leader>lz", require("config.globals").open_lazygit, { desc = "Open LazyGit" })
keymap("n", "<leader>hp", require("config.globals").open_htop, { desc = "Open htop" })

-- Terminal --
local term_opts = { silent = true, noremap = true }
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)
